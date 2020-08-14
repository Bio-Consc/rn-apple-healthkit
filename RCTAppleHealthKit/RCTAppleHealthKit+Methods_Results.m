#import "RCTAppleHealthKit+Methods_Results.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

@implementation RCTAppleHealthKit (Methods_Results)


- (void)results_getBloodGlucoseSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    HKQuantityType *bloodGlucoseType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose];

    HKUnit *mmoLPerL = [[HKUnit moleUnitWithMetricPrefix:HKMetricPrefixMilli molarMass:HKUnitMolarMassBloodGlucose] unitDividedByUnit:[HKUnit literUnit]];

    HKUnit *unit = [RCTAppleHealthKit hkUnitFromOptions:input key:@"unit" withDefault:mmoLPerL];
    NSUInteger limit = [RCTAppleHealthKit uintFromOptions:input key:@"limit" withDefault:HKObjectQueryNoLimit];
    BOOL ascending = [RCTAppleHealthKit boolFromOptions:input key:@"ascending" withDefault:false];
    NSDate *startDate = [RCTAppleHealthKit dateFromOptions:input key:@"startDate" withDefault:nil];
    NSDate *endDate = [RCTAppleHealthKit dateFromOptions:input key:@"endDate" withDefault:[NSDate date]];
    if(startDate == nil){
        callback(@[RCTMakeError(@"startDate is required in options", nil, nil)]);
        return;
    }
    NSPredicate * predicate = [RCTAppleHealthKit predicateForSamplesBetweenDates:startDate endDate:endDate];

    [self fetchQuantitySamplesOfType:bloodGlucoseType
                                unit:unit
                           predicate:predicate
                           ascending:ascending
                               limit:limit
                          completion:^(NSArray *results, NSError *error) {
        if(results){
            callback(@[[NSNull null], results]);
            return;
        } else {
            callback(@[RCTJSErrorFromNSError(error)]);
            return;
        }
    }];
}

- (void)results_saveBloodGlucoseSamples:(NSArray *)input callback:(RCTResponseSenderBlock)callback
{
    for (NSDictionary *point in input) {
        double timestamp = [RCTAppleHealthKit doubleFromOptions:point key:@"timestamp" withDefault:(double)0];
        double value = [RCTAppleHealthKit doubleFromOptions:point key:@"value" withDefault:(double)0];
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
        
        HKUnit *unit = [[HKUnit gramUnitWithMetricPrefix:HKMetricPrefixMilli] unitDividedByUnit:[HKUnit literUnitWithMetricPrefix:HKMetricPrefixDeci]];
        
        HKQuantity *sample = [HKQuantity quantityWithUnit:unit doubleValue:value];
        
        HKQuantitySample *glucoseSample = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose] quantity:sample startDate:date endDate:date];
        
        [self.healthStore saveObject: glucoseSample withCompletion:^(BOOL success, NSError *error) {
            if (!success) {
                NSLog(@"An error occured save the blood glucose sample: %@", error);
                callback(@[RCTMakeError(@"error saving blood glucose sample", error, nil)]);
                return;
            }
        }];
    }
    
    callback(@[[NSNull null], @true]);
}

- (void)results_saveBloodGlucoseSample:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    double timestamp = [RCTAppleHealthKit doubleFromOptions:input key:@"timestamp" withDefault:(double)0];
    double value = [RCTAppleHealthKit doubleFromOptions:input key:@"value" withDefault:(double)0];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
   
    HKUnit *unit = [[HKUnit gramUnitWithMetricPrefix:HKMetricPrefixMilli] unitDividedByUnit:[HKUnit literUnitWithMetricPrefix:HKMetricPrefixDeci]];
    
    HKQuantity *sample = [HKQuantity quantityWithUnit:unit doubleValue:value];
    
    HKQuantitySample *glucoseSample = [HKQuantitySample quantitySampleWithType:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose] quantity:sample startDate:date endDate:date];
    
    [self.healthStore saveObject:glucoseSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"An error occured save the blood glucose sample: %@", error);
            callback(@[RCTMakeError(@"error saving blood glucose sample", error, nil)]);
            return;
        }
        callback(@[[NSNull null], @true]);
    }];
}

@end
