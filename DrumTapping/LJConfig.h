//
//  LJConfig.h
//  DrumTapping
//
//  Created by LeiJing on 26/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

//This class is for loading the config file 

#import <Foundation/Foundation.h>

@interface LJConfig : NSObject

@property (nonatomic, readonly, assign) NSDictionary *configDict;

+ (LJConfig *)sharedModel;

- (BOOL)loadConfig;

@end
