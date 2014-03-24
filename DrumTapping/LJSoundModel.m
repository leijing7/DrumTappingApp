//
//  SoundModel.m
//  SuperEasyAlarm
//
//  Created by Lei Jing on 24/08/12.
//  Copyright (c) 2012 UWS. All rights reserved.
//

#import "LJSoundModel.h"
#import <AVFoundation/AVAudioPlayer.h>


@interface LJSoundModel( )

- (BOOL)loadSound:(NSString *)filename
        extention:(NSString *)ext
          soundID:(SystemSoundID *)sid
         duration:(double *)du;
@end

@implementation LJSoundModel
{
    SystemSoundID cowbellID;
    SystemSoundID woodID;
}

+ (LJSoundModel *)sharedModel
{
    static LJSoundModel *sharedModel = nil;
    if (!sharedModel) {
        sharedModel = [[super allocWithZone:nil] init];
    }
    return sharedModel;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedModel];
}

- (BOOL)loadSound:(NSString *)filename extention:(NSString *)ext soundID:(SystemSoundID *)sid duration:(double *)du
{
//load sound id and property
    NSString *sndpath = [[NSBundle mainBundle] pathForResource:filename ofType:ext];
    CFURLRef baseURL = (__bridge CFURLRef)[NSURL fileURLWithPath:sndpath];
    
    OSStatus status = AudioServicesCreateSystemSoundID(baseURL, sid);
    if (status != noErr) {
        DDLogError(@"Cannot create sound: %d", (int)status);
        return NO;
    }

    AudioServicesPropertyID flag = 0;  // 0 means always play
    status = AudioServicesSetProperty(kAudioServicesPropertyIsUISound, sizeof(SystemSoundID), sid, sizeof(AudioServicesPropertyID), &flag);
    if (status != noErr) {
        DDLogError(@"Cannot set sound property: %d", (int)status);
        return NO;
    }
    
//get the sound duration
    NSString *filepath = [NSString stringWithFormat:@"%@/%@%@%@", [[NSBundle mainBundle] resourcePath], filename, @".", ext];
    NSURL *fileurl = [NSURL fileURLWithPath:[NSString stringWithFormat:filepath, [[NSBundle mainBundle] resourcePath]]];
    NSError *err;
    AVAudioPlayer *avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileurl error:&err];
    if (err) {
        DDLogError(@"Audio (%@) init error. ", fileurl);
        return NO;
    }
    *du = avAudioPlayer.duration * 1000;
    avAudioPlayer = nil;
    
    return YES;
}

- (BOOL)loadSounds
{
    BOOL bCowbellLoding = [self loadSound: @"cowbell" extention: @"wav" soundID: &cowbellID duration:&_cowbellDuration];
    BOOL bWoodLoading = [self loadSound: @"wood" extention: @"wav" soundID: &woodID duration:&_woodDuration];
    
    if (bCowbellLoding && bWoodLoading) {
        DDLogDebug(@"Sounds loading successful.");
        return YES;
    } else {
        DDLogError(@"Sounds loading error.");
        return NO;
    };
}

- (void)playCowbell
{
    AudioServicesPlaySystemSound(cowbellID);
}

- (void)playWood
{
    AudioServicesPlaySystemSound(woodID);
}

@end
