//
//  LJConfig.m
//  DrumTapping
//
//  Created by marcstech on 26/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import "LJConfig.h"

@implementation LJConfig

+ (LJConfig *)sharedModel
{
    static LJConfig *sharedModel = nil;
    if (!sharedModel) {
        sharedModel = [[super allocWithZone:nil] init];
    }
    return sharedModel;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedModel];
}

//if the json file is dictionary, must output as dictionary.
- (BOOL)loadConfig
{
    NSString *configPath = [[NSBundle mainBundle] pathForResource:@"test3" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:configPath];
    
    NSError *err = nil;
    _configDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
    
    if (err) {
        DDLogError(@"Config file: %@ loading failed.", configPath);
        return NO;
    } else {
        return YES;
    }
}


@end
