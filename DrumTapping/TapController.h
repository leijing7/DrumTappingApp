//
//  TapProcess.h
//  DrumTapping
//
//  Created by Lei Jing on 3/03/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

//This class is to controll the experitment process. Relieve some of the jobs from TappingViewController
//Easy to share data between TapView and TappingViewController by this way.

#import <Foundation/Foundation.h>

@interface TapController : NSObject

+ (TapController *)sharedModel;

- (void)initCommon;

- (void)recordTapdownTime;
- (void)recordTapupTime;

- (void)playCowbellThenWait:(unsigned long long)t;

- (void)begin;
- (void)run;
- (void)end;

@end
