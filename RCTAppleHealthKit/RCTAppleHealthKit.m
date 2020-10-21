//
//  RCTAppleHealthKit.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit.h"
#import "RCTAppleHealthKit+TypesAndPermissions.h"

#import "RCTAppleHealthKit+Methods_Activity.h"
#import "RCTAppleHealthKit+Methods_Body.h"
#import "RCTAppleHealthKit+Methods_Fitness.h"
#import "RCTAppleHealthKit+Methods_Dietary.h"
#import "RCTAppleHealthKit+Methods_Characteristic.h"
#import "RCTAppleHealthKit+Methods_Vitals.h"
#import "RCTAppleHealthKit+Methods_Results.h"
#import "RCTAppleHealthKit+Methods_Sleep.h"
#import "RCTAppleHealthKit+Methods_Mindfulness.h"
#import "RCTAppleHealthKit+Utils.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>

@implementation RCTAppleHealthKit

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTResponseSenderBlock)callback)
{
    [self isHealthKitAvailable:callback];
}

RCT_EXPORT_METHOD(initHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self initializeHealthKit:input callback:callback];
}

RCT_EXPORT_METHOD(initStepCountObserver:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_initializeStepEventObserver:input callback:callback];
}

RCT_EXPORT_METHOD(getBiologicalSex:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getBiologicalSex:input callback:callback];
}

RCT_EXPORT_METHOD(getDateOfBirth:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getDateOfBirth:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestWeight:input callback:callback];
}

RCT_EXPORT_METHOD(getWeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getWeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveWeight:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getHeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getHeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(saveBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBodyFatPercentage:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyFatPercentage:input callback:callback];
}

RCT_EXPORT_METHOD(getBodyFatPercentageSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getBodyFatPercentageSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveBodyFatPercentage:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveBodyFatPercentage:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestLeanBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestLeanBodyMass:input callback:callback];
}

RCT_EXPORT_METHOD(getLeanBodyMassSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLeanBodyMassSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveLeanBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveLeanBodyMass:input callback:callback];
}

RCT_EXPORT_METHOD(getStepCount:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getStepCountOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getSamples:input callback:callback];
}

RCT_EXPORT_METHOD(setObserverForSampleType:(NSDictionary *)input)
{
    [self observer_setObserverForSampleType:input];
}

RCT_EXPORT_METHOD(disableObserverationForSampleType:(NSDictionary *)input)
{
    [self observer_disableObservationForType:input];
}

RCT_EXPORT_METHOD(disableAllObservations)
{
    [self observer_disableAll];
}

RCT_EXPORT_METHOD(getDailyStepCountSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyStepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveSteps:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_saveSteps:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceWalkingRunning:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceWalkingRunningOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceWalkingRunningSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceWalkingRunningSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceSwimmingSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceSwimmingSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceCycling:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceCyclingOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceCyclingSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceCyclingSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getFlightsClimbed:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getFlightsClimbedOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyFlightsClimbedSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyFlightsClimbedSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveFood:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveFood:input callback:callback];
}

RCT_EXPORT_METHOD(saveWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveWater:input callback:callback];
}

RCT_EXPORT_METHOD(getHeartRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getHeartRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getActiveEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
   [self activity_getActiveEnergyBurned:input callback:callback];
}

RCT_EXPORT_METHOD(getActiveEnergyDailySamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
   [self activity_getActiveEnergyDailySamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBasalEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
   [self activity_getBasalEnergyBurned:input callback:callback];
}

RCT_EXPORT_METHOD(getBasalEnergyDailySamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
   [self activity_getBasalEnergyDailySamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBodyTemperatureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBodyTemperatureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodPressureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBloodPressureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getRespiratoryRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getRespiratoryRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodGlucoseSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self results_getBloodGlucoseSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveBloodGlucoseSample:(NSDictionary *)input
                  callback:(RCTResponseSenderBlock)callback)
{
    [self results_saveBloodGlucoseSample:input callback:callback];
}

RCT_EXPORT_METHOD(getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self sleep_getSleepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self getModuleInfo:input callback:callback];
}

RCT_EXPORT_METHOD(saveMindfulSession:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self mindfulness_saveMindfulSession:input callback:callback];
}

RCT_EXPORT_METHOD(getMindfulSession:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self mindfulness_getMindfulSession:input callback:callback];
}

- (void)isHealthKitAvailable:(RCTResponseSenderBlock)callback
{
    BOOL isAvailable = NO;
    if ([HKHealthStore isHealthDataAvailable]) {
        isAvailable = YES;
    }
    callback(@[[NSNull null], @(isAvailable)]);
}

RCT_EXPORT_METHOD(setObserverForType:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self setObserverForType:input callback:callback];
}

- (void)observer_disableObservationForType: (NSDictionary *)input
{
    NSString *type = [RCTAppleHealthKit stringFromOptions:input key:@"type" withDefault:@""];
    if ([type isEqualToString: @""]) {
        return;
    }
    
    HKSampleType *sampleType = [RCTAppleHealthKit hkQuantityTypeFromString:type];
    
    [self.healthStore disableBackgroundDeliveryForType:sampleType withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            NSLog(@"*** Failure to disable observation for type %@: %@ ***", type, error.description);
            return;
        }
    }];
}

- (void)observer_disableAll
{
    [self.healthStore disableAllBackgroundDeliveryWithCompletion:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            NSLog(@"*** Failure to disable observations: %@ ***", error.description);
            return;
        }
    }];
}

- (void)observer_setObserverForSampleType:(NSDictionary *)input
{
    double period = [RCTAppleHealthKit doubleFromOptions:input key:@"period" withDefault:(double)86400];
    NSString *type = [RCTAppleHealthKit stringFromOptions:input key:@"type" withDefault:@"walking"];
    
    HKSampleType *sampleType = [RCTAppleHealthKit hkQuantityTypeFromString:type];
    HKUnit *unit = [RCTAppleHealthKit hkUnitFromHKQuantityType:type];
    
    [self setObserverForType:sampleType unit:unit period:period];
}

- (void)setObserverForType:(HKSampleType *)type
                      unit:(HKUnit *)unit
                    period: (double)period {
    
    HKObserverQuery *query = [[HKObserverQuery alloc] initWithSampleType:type predicate:nil updateHandler:^(HKObserverQuery *query, HKObserverQueryCompletionHandler completionHandler, NSError * _Nullable error) {
        if (error) {
            NSLog(@"*** An error occurred while reading %@: %@ ***", type.description, error.localizedDescription);
            completionHandler();
            return;
        }
        
        NSUInteger limit = HKObjectQueryNoLimit;
        NSDate *startQuery = [NSDate dateWithTimeIntervalSinceNow:-period];
        NSDate *endQuery = [NSDate date];
        NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startQuery endDate:endQuery options:HKQueryOptionNone];
        
        HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:type predicate:predicate limit:limit sortDescriptors:false resultsHandler:^(HKSampleQuery *query, NSArray *results, NSError *error) {
            
            NSMutableArray *data = [NSMutableArray arrayWithCapacity:1];
            
            for (HKQuantitySample *sample in results) {
                if ([[RCTAppleHealthKit stringFromHKQuantityType:type] isEqualToString:@"BloodPressure"]) {
                    HKQuantityType *systolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
                    HKQuantityType *diastolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];

                    HKQuantitySample *systolicSample = [[((HKCorrelation *) sample) objectsForType:systolicType] anyObject];
                    HKQuantitySample *diastolicSample = [[((HKCorrelation *) sample) objectsForType:diastolicType] anyObject];
                    
                    double startDate = [sample.startDate timeIntervalSince1970];
                    double endDate = [sample.endDate timeIntervalSince1970];

                    NSDictionary *elem = @{
                       @"systolicValue" : @([systolicSample.quantity doubleValueForUnit:unit]),
                       @"diastolicValue" : @([diastolicSample.quantity doubleValueForUnit:unit]),
                       @"startDate" : @(startDate),
                       @"endDate" : @(endDate),
                    };

                    [data addObject:elem];
                    
                } else {
                    
                    NSString *valueType = unit.description;
                    
                    HKQuantity *quantity = sample.quantity;
                    double value = [quantity doubleValueForUnit:unit];
                    
                    double startDate = [sample.startDate timeIntervalSince1970];
                    double endDate = [sample.endDate timeIntervalSince1970];
                    
                    NSDictionary *elem = @{
                    @"value" : @(value),
                    @"startDate": @(startDate),
                    @"endDate": @(endDate),
                    };
                    
                    [data addObject:elem];
                }
            }
            
            if (data.count > 0) {
                NSDictionary *message = @{
                    @"type": [RCTAppleHealthKit stringFromHKQuantityType: type],
                    @"data": data,
                };
                
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:message options:NSJSONWritingPrettyPrinted error:&error];
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                
                [self.bridge.eventDispatcher sendAppEventWithName:@"observer" body:jsonString];
            }
            completionHandler();
        }];
        
        [self.healthStore executeQuery:sampleQuery];
    }];
    
    [self.healthStore executeQuery:query];
    
    [self.healthStore enableBackgroundDeliveryForType:type frequency:HKUpdateFrequencyImmediate withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            NSLog(@"*** An error occurred with background delivery for type %@: %@ ***", type.description, error.localizedDescription);
            return;
        }
    }];
}



- (void)initializeHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    self.healthStore = [[HKHealthStore alloc] init];

    if ([HKHealthStore isHealthDataAvailable]) {
        NSSet *writeDataTypes;
        NSSet *readDataTypes;

        // get permissions from input object provided by JS options argument
        NSDictionary* permissions =[input objectForKey:@"permissions"];
        if(permissions != nil){
            NSArray* readPermsArray = [permissions objectForKey:@"read"];
            NSArray* writePermsArray = [permissions objectForKey:@"write"];
            NSSet* readPerms = [self getReadPermsFromOptions:readPermsArray];
            NSSet* writePerms = [self getWritePermsFromOptions:writePermsArray];

            if(readPerms != nil) {
                readDataTypes = readPerms;
            }
            if(writePerms != nil) {
                writeDataTypes = writePerms;
            }
        } else {
            callback(@[RCTMakeError(@"permissions must be provided in the initialization options", nil, nil)]);
            return;
        }

        // make sure at least 1 read or write permission is provided
        if(!writeDataTypes && !readDataTypes){
            callback(@[RCTMakeError(@"at least 1 read or write permission must be set in options.permissions", nil, nil)]);
            return;
        }

        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success) {
                callback(@[RCTJSErrorFromNSError(error)]);
                return;
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    callback(@[[NSNull null], @true]);
                });
            }
        }];
    } else {
        callback(@[RCTMakeError(@"HealthKit data is not available", nil, nil)]);
    }
}

RCT_EXPORT_METHOD(authorizationStatusForType:(NSString *)type
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
{
    if (self.healthStore == nil) {
        self.healthStore = [[HKHealthStore alloc] init];
    }

    if ([HKHealthStore isHealthDataAvailable]) {
        HKObjectType *objectType = [self getWritePermFromString:type];
        if (objectType == nil) {
            reject(@"unknown write permission", nil, nil);
            return;
        }

        NSString *status = [self getAuthorizationStatusString:[self.healthStore authorizationStatusForType:objectType]];
        resolve(status);
    } else {
        reject(@"HealthKit data is not available", nil, nil);
    }
})

- (void)getModuleInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSDictionary *info = @{
            @"name" : @"react-native-apple-healthkit",
            @"description" : @"A React Native bridge module for interacting with Apple HealthKit data",
            @"className" : @"RCTAppleHealthKit",
            @"author": @"Greg Wilson",
    };
    callback(@[[NSNull null], info]);
}

@end
