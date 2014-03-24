//
//  LJTappingViewController.m
//  DrumTapping
//
//  Created by marcstech on 24/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import "TappingViewController.h"
#import "TapController.h"

@interface TappingViewController ()

@end

@implementation TappingViewController
{
    TapController *tapController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self initCommon];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initCommon];
    }
    return self;
}

- (void)initCommon
{        
    tapController = [TapController sharedModel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonClicked:(id)sender
{
//Have to run the play sound stuff on another thread, to avoid blocking the current gui thread.
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [tapController run];
    });
    
//    double CurrentTime2 = CACurrentMediaTime();
//    uint64_t now2 = mach_absolute_time();
//    uint64_t interval = ( now2 - now1 )* timebase_info.numer / (NANOS_PER_USEC * timebase_info.denom) ;
//    
//    NSNumber *iNum = [NSNumber numberWithUnsignedLongLong:interval];
//    NSLog([iNum stringValue]);
//    
//    NSNumber *dNum2 = [NSNumber numberWithDouble:CurrentTime2-CurrentTime1];
//    NSNumber *dNum1 = [NSNumber numberWithDouble:CurrentTime1];
//    NSLog([dNum1 stringValue]);
//    NSLog([dNum2 stringValue]);
    
}

@end
