//
//  TimeTagModel.m
//  DrumTapping
//
//  Created by marcstech on 28/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import "TimeModel.h"
#import <mach/mach.h>
#import <mach/mach_time.h>

@implementation TimeModel
{
    uint64_t NANOS_PER_USEC;
    uint64_t NANOS_PER_MILLISEC;
    //static const uint64_t NANOS_PER_SEC = 1000ULL * NANOS_PER_MILLISEC;
    uint64_t coefficient;
    
    mach_timebase_info_data_t timebase_info;
}

+ (TimeModel *)sharedModel
{
    static TimeModel *sharedModel = nil;
    if (!sharedModel) {
        sharedModel = [[super allocWithZone:nil] init];
    }
    return sharedModel;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedModel];
}

- (void)initCommon
{
    _tapdownTimeArray = [[NSMutableArray alloc] init];
    _tapupTimeArray = [[NSMutableArray alloc] init];
    _soundStartTimeArray = [[NSMutableArray alloc] init];
    
    NANOS_PER_USEC = 1000ULL;
    NANOS_PER_MILLISEC = 1000ULL * NANOS_PER_USEC;
    //static const uint64_t NANOS_PER_SEC = 1000ULL * NANOS_PER_MILLISEC;
    
    mach_timebase_info( &timebase_info );
    
    coefficient = NANOS_PER_MILLISEC * timebase_info.denom / timebase_info.numer;
}

- (void)addCurrentTimeToArray: (NSMutableArray *)arr
{
    double currentTime = CACurrentMediaTime();
    [arr addObject:[NSNumber numberWithDouble:currentTime]];
}

- (void)waitTime:(unsigned long long)interval
{
    uint64_t time_to_wait = interval * coefficient;
    uint64_t now = mach_absolute_time();
    
    mach_wait_until(now + time_to_wait);
}

@end
