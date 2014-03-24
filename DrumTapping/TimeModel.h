//
//  TimeTagModel.h
//  DrumTapping
//
//  Created by Lei Jing on 28/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

//This file is time utility for getting the events time and timer.
//timer uses the low level mach_wait_until 

#import <Foundation/Foundation.h>

@interface TimeModel : NSObject

+ (TimeModel *)sharedModel;

- (void)initCommon;
- (void)addCurrentTimeToArray: (NSMutableArray *)arr;

//interval unit is mil second
- (void)waitTime:(unsigned long long)interval;

@property (nonatomic, readwrite, strong) NSMutableArray *soundStartTimeArray;

@property (nonatomic, readwrite, strong) NSMutableArray *tapdownTimeArray;
@property (nonatomic, readwrite, strong) NSMutableArray *tapupTimeArray;

@property (nonatomic, readwrite, assign) double experimentStartTime;

@end
