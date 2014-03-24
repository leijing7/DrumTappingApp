//
//  TapProcess.m
//  DrumTapping
//
//  Created by marcstech on 3/03/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import "TapController.h"
#import "TimeModel.h"
#import "LJSoundModel.h"
#import "LJConfig.h"

@implementation TapController
{
    LJSoundModel *soundModel;
    TimeModel *timeModel;
    LJConfig *config;
    
    unsigned long long BaseIOI;
    unsigned long long Alpha;
    long Continuation;
    long NumberOfClicks;
    long Equation;
    NSArray *Intervals;
}

+ (TapController *)sharedModel
{
    static TapController *sharedModel = nil;
    if (!sharedModel) {
        sharedModel = [[super allocWithZone:nil] init];
    }
    return sharedModel;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedModel];
}

static const unsigned long long computingOverheadOffsetTime = 1;

- (void)initCommon
{
    soundModel = [LJSoundModel sharedModel];
    [soundModel loadSounds];
    
    timeModel = [TimeModel sharedModel];
    [timeModel initCommon];
    
    config = [LJConfig sharedModel];
    [config loadConfig];
    
    BaseIOI = [[[[config configDict] objectForKey:@"round1"] objectForKey:@"BaseIOI"] unsignedLongLongValue];
    Alpha = [[[[config configDict] objectForKey:@"round1"] objectForKey:@"Alpha"] unsignedLongLongValue];
    Continuation = [[[[config configDict] objectForKey:@"round1"] objectForKey:@"Continuation"] integerValue];
    NumberOfClicks = [[[[config configDict] objectForKey:@"round1"] objectForKey:@"NumberOfClicks"] integerValue];
    Equation = [[[[config configDict] objectForKey:@"round1"] objectForKey:@"Equation"] integerValue];
    Intervals = [[[config configDict] objectForKey:@"round1"] objectForKey:@"Intervals"];
}

- (void)recordTapdownTime
{
    [timeModel addCurrentTimeToArray:timeModel.tapdownTimeArray];
}

- (void)recordTapupTime
{
    [timeModel addCurrentTimeToArray:timeModel.tapupTimeArray];
}

//wait mil seconds
- (void)playCowbellThenWait:(unsigned long long)t
{
    [timeModel addCurrentTimeToArray:timeModel.soundStartTimeArray];
    
    [soundModel playCowbell];
    unsigned long long intervalWithSoundDuration = t + [soundModel cowbellDuration];
    [timeModel waitTime:intervalWithSoundDuration];
}

- (void)begin
{
    timeModel.experimentStartTime = CACurrentMediaTime();
    
    [NSThread sleepForTimeInterval:1];

//repeat to play 3 times of the sound at the beginning accoridng to the spec
    for (int i=0; i<3; i++) {
        [self playCowbellThenWait:BaseIOI - computingOverheadOffsetTime];
    }    
}

- (void)run
{
    [self begin];
    
    //for (int i=0; i<5; i++) {
    for (int i=0; i<NumberOfClicks; i++) {
//minus 1 is to compensate the overhead of computing time
        [self playCowbellThenWait:[[Intervals objectAtIndex:i] unsignedLongLongValue] - computingOverheadOffsetTime];
    }
    
    [self end];
}

- (void)end
{
    [self serializeData];
    [self emptyDataArrays];
}

//empty array for next experiment
- (void)emptyDataArrays
{
    [timeModel.soundStartTimeArray removeAllObjects];
    [timeModel.tapdownTimeArray removeAllObjects];
    [timeModel.tapupTimeArray removeAllObjects];
}

- (void)serializeData
{
    NSArray *objArray = [NSArray arrayWithObjects:timeModel.soundStartTimeArray, timeModel.tapdownTimeArray, timeModel.tapupTimeArray, nil];
    NSArray *keyArray = [NSArray arrayWithObjects:@"soundStartTime", @"tapdownTime", @"tapupTime", nil];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects: objArray forKeys:keyArray];
    DDLogDebug(@"add tapdown time, %@", dict);
    DDLogDebug(@"add tapdown time, %@", timeModel.tapupTimeArray);
    
    NSData *jsonData = [self getJsonFromDict:dict];
    NSString *urlStr = @"http://tappingdrum.appspot.com";
    
    [self postJson:jsonData toServer:urlStr];
    [self saveJson:jsonData];
}

- (NSData *)getJsonFromDict:(NSDictionary *)dict
{
    NSError *err = nil;
    NSData *jsonData = nil;
    @try {
        jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&err];
    }
    @catch (NSException *exception){
        DDLogError(@"NSJSon Exception: %@", exception);
        DDLogError(@"Error: %@", err);
        return nil;
    }
    
    return jsonData;
}

- (void)postJson:(NSData *)json toServer:(NSString *)urlAsString
{
    DDLogDebug(@"Json Data: %@",[[NSString alloc] initWithData:json encoding:NSUTF8StringEncoding]);
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    DDLogDebug(@"url: %@", urlRequest);
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:json];
    
    NSOperationQueue *opQueue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:opQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil) {
            DDLogDebug(@"Send json to %@ successfully.", urlAsString);
        } else if ([data length] == 0 && error == nil){
            DDLogDebug(@"Nothing was downloaded");
        } else if (error != nil){
            DDLogError(@"Post Error happened = %@", error);
        } else {
            DDLogError(@"Nothing got from server.");
        }
    }];
    DDLogDebug(@"Posted the data.");
    //urlRequest = nil;
}

- (void)saveJson:(NSData *)json
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"AETZ"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
    NSDate *date = [NSDate date];
    NSString *filename = [NSString stringWithFormat:@"%@.%@", [dateFormatter stringFromDate:date], @"json"];
    dateFormatter = nil;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    NSString *filepath = [NSString stringWithFormat:@"%@%@", docDirectory, filename];
    if ( [json writeToFile:filepath atomically:YES] ){
        DDLogDebug(@"Write json filepath: %@, successfully.", filepath);
    } else {
        DDLogError(@"ERROR: Can not write the result json data to %@.", filepath);
    }
}

@end
