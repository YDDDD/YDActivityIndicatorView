//
//  YDActivityIndicatorView.m
//  YDActivityIndicator
//
//  Created by yellowdavid on 2017/3/16.
//  Copyright © 2017年 yellowdavid. All rights reserved.
//

#import "YDActivityIndicatorView.h"
#import <CoreGraphics/CoreGraphics.h>

#define LINE_WIDTH 4.0

@interface YDActivityIndicatorView ()

@property (strong, nonatomic) CAShapeLayer *progressLayer;

@end

@implementation YDActivityIndicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.opaque = NO;
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    }
    return self;
}

#define ANGLE_FROM_NORTH(angle) (angle - M_PI_2) < 0 ? angle + M_PI_2 * 3 : angle - M_PI_2

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.width / 2);
    CGFloat radius = MIN(self.frame.size.width, self.frame.size.height) / 2 - 5;
    
    _progressLayer = [CAShapeLayer layer];
    
    UIBezierPath *mainPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:ANGLE_FROM_NORTH(0) endAngle:ANGLE_FROM_NORTH(2 * M_PI - 0.01) clockwise:YES];
    //mainPath.lineWidth = LINE_WIDTH;
    //mainPath.lineCapStyle = kCGLineCapButt;
    //[[UIColor colorWithRed:0.7 green:0.83 blue:0.88 alpha:1] set];
    //[[UIColor blackColor] set];
    //[mainPath stroke];
    
    
    [_progressLayer setPath:mainPath.CGPath];
    _progressLayer.lineWidth = LINE_WIDTH;
    _progressLayer.lineCap = kCGLineCapButt;
    _progressLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    //progressLayer.strokeColor = [UIColor colorWithRed:0.7 green:0.83 blue:0.88 alpha:1].CGColor;
    _progressLayer.strokeColor = [UIColor blackColor].CGColor;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:_progressLayer];
    
    
    CABasicAnimation *animationForEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animationForEnd.autoreverses = NO;
    //animationForEnd.duration = 1.5;
    //animationForEnd.repeatCount = CGFLOAT_MAX;
    animationForEnd.fromValue = @0.01;
    animationForEnd.byValue = @1;
    animationForEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animationForEnd.removedOnCompletion = NO;
    
    CABasicAnimation *animationForStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animationForStart.autoreverses = NO;
    //animationForStart.duration = 1.5;
    //animationForStart.repeatCount = CGFLOAT_MAX;
    animationForStart.fromValue = @0;
    animationForStart.byValue = @0.99;
    animationForStart.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationForStart.removedOnCompletion = NO;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animationForStart, animationForEnd];
    animationGroup.duration = 2;
    animationGroup.repeatCount = CGFLOAT_MAX;
    [_progressLayer addAnimation:animationGroup forKey:@"PROGRESSING"];
    
    CABasicAnimation *animationForRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animationForRotation.fromValue = @0;
    animationForRotation.toValue = @(2 * M_PI);
    animationForRotation.duration = 16;
    animationForRotation.repeatCount = CGFLOAT_MAX;
    animationForRotation.removedOnCompletion = NO;
    [_progressLayer addAnimation:animationForRotation forKey:@"ROTATION"];
}



@end
