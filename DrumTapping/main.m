//
//  main.m
//  DrumTapping
//
//  Created by marcstech on 24/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LJAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([LJAppDelegate class]));
    }
}


/* KNOW ISSUE
 1. When open this app, play the first sound, the sound volume is kind of lower than the same sound later.
    But this problem is only existing within the speaker. It is always good - the same volume if using earphone.
    To solve this, can let user play sound and change the volume so the first time sound will not be used.

*/