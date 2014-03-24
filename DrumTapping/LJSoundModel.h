//This file is for loading and playing the sound file

#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>

@interface LJSoundModel : NSObject

@property (nonatomic, readonly, assign) double cowbellDuration; //mil second
@property (nonatomic, readonly, assign) double woodDuration;

+ (LJSoundModel *)sharedModel;

- (BOOL)loadSounds;

- (void)playCowbell;
- (void)playWood;

@end
