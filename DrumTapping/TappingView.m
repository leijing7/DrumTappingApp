//
//  TappingView.m
//  DrumTapping
//
//  Created by marcstech on 25/02/2014.
//  Copyright (c) 2014 MARCS. All rights reserved.
//

#import "TappingView.h"
#import "TapController.h"

@implementation TappingView
{
    CGRect drumAreaRect_;
    CGFloat drumRadius_;
    CGPoint drumCenter_;
    
    TapController *tapController;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initCommon];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initCommon];
    }
    return self;
}

- (void)initCommon
{
    tapController = [TapController sharedModel];
    [tapController initCommon];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextSetRGBFillColor(contextRef, 0.5, 0.5, 0.5, 1.0);
    CGContextSetRGBStrokeColor(contextRef, 0, 0, 1.0, 1.0);
    
    drumAreaRect_ = [self genDrumAreaRect];
    CGContextFillEllipseInRect(contextRef, drumAreaRect_);
}

- (CGRect)genDrumAreaRect
{
    //CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    //CGFloat viewHeight = CGRectGetHeight(self.bounds);
    
    CGFloat margin = 25;
    CGFloat drumRectUpperLeftPointX = margin;
    CGFloat drumRectUpperLeftPointY = margin*2;
    drumRadius_ = viewWidth/2-margin;
    drumCenter_ = CGPointMake(drumRectUpperLeftPointX + drumRadius_, drumRectUpperLeftPointY + drumRadius_);
    
    return (CGRectMake(drumRectUpperLeftPointX, drumRectUpperLeftPointY, drumRadius_*2, drumRadius_*2));
}

- (BOOL)drumContainsPoint:(CGPoint) pt
{
    CGFloat distance = sqrt(pow((pt.x - drumCenter_.x), 2) + pow((pt.y - drumCenter_.y), 2));
    
    return (distance <= drumRadius_) ? YES : NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchedPoint = [touch locationInView:touch.view];
    
    if ([self drumContainsPoint: touchedPoint])
    {
        [tapController recordTapdownTime];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchedPoint = [touch locationInView:touch.view];
    
    if ([self drumContainsPoint: touchedPoint])
    {
        [tapController recordTapupTime];
    }

}


@end
