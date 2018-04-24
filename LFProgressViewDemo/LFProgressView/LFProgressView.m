//
//  LFProgressView.m
//  LFProgressViewDemo
//
//  Created by liufei on 2018/4/22.
//  Copyright © 2018年 liufei. All rights reserved.
//

#import "LFProgressView.h"
#import "UIView+Extension.h"
@interface LFProgressView ()

@property (nonatomic, strong) CAShapeLayer  *backGroundLayer;

@property (nonatomic, strong) CAShapeLayer  *progressLayer;

@property (nonatomic, strong) NSMutableArray *colors;


@end


@implementation LFProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _progressWidth = 10.f;
        self.progressViewType = LFProgressViewTypeHorizontal;
    }
    return self;
}
- (void)setProgressViewType:(LFProgressViewType)progressViewType {
    _progressViewType = progressViewType;
    [self setNeedsDisplay];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self beiginAnmation];
}
- (void)setProgressWidth:(CGFloat)progressWidth {
    _progressWidth = progressWidth;
}
- (void)beiginAnmation {
    //进度条动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:_progress];
    self.progressLayer.strokeEnd = _progress;
    animation.duration = 3.0f;
    [self.progressLayer addAnimation:animation forKey:@"strokeEndAnimation"];
}
- (CAShapeLayer *)backGroundLayer {
    if (!_backGroundLayer) {
        _backGroundLayer = [CAShapeLayer layer];
        _backGroundLayer.frame = self.bounds;
        _backGroundLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _backGroundLayer.lineWidth = self.progressWidth;
        _backGroundLayer.fillColor = nil;
    }
    return _backGroundLayer;
}
- (CAShapeLayer *)progressLayer {
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.frame = self.bounds;
        _progressLayer.lineWidth = self.progressWidth;
        _progressLayer.strokeColor = [UIColor whiteColor].CGColor;
        _progressLayer.fillColor = nil;
    }
    return _progressLayer;
}
- (void)drawRect:(CGRect)rect {
    if (_progressViewType == LFProgressViewTypeHorizontal) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, self.LF_height/2)];
        [path addLineToPoint:CGPointMake(self.LF_width, self.LF_height/2)];
        path.lineWidth = _progressWidth;
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        
        gradientLayer.colors = self.colors;
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
        self.progressLayer.path = path.CGPath;
        gradientLayer.mask = self.progressLayer;
        self.backGroundLayer.path = path.CGPath;
        [self.layer addSublayer:self.backGroundLayer];
        [self.layer addSublayer:gradientLayer];
        
    } else {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.LF_width/2, self.LF_height/2) radius:self.LF_width / 2 - _progressWidth/2  startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI * 2 clockwise:YES];
        self.progressLayer.path = path.CGPath;
        self.backGroundLayer.path = path.CGPath;
        [self.layer addSublayer:self.backGroundLayer];
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        ///左上角
        CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(0, 0, self.LF_width/2, self.LF_height/2);
        gradientLayer1.colors = self.colors;
        ///右上角
        CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
        gradientLayer2.frame = CGRectMake(self.LF_width/2, 0, self.LF_width/2, self.LF_height/2);
        gradientLayer2.colors = self.colors;
        ///左下角
        CAGradientLayer *gradientLayer3 = [CAGradientLayer layer];
        gradientLayer3.frame  = CGRectMake(0, self.LF_height/2, self.LF_width/2, self.LF_height/2);
        gradientLayer3.colors = self.colors;
        ///右下角
        CAGradientLayer *gradientLayer4 = [CAGradientLayer layer];
        gradientLayer4.frame = CGRectMake(self.LF_width/2, self.LF_height/2, self.LF_width/2, self.LF_height/2);
        gradientLayer4.colors = self.colors;
        
        [gradientLayer addSublayer:gradientLayer1];
        [gradientLayer addSublayer:gradientLayer2];
        [gradientLayer addSublayer:gradientLayer3];
        [gradientLayer addSublayer:gradientLayer4];
        gradientLayer.mask = self.progressLayer;
        [self.layer addSublayer:gradientLayer];
    }

}
- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = [NSMutableArray array];
        for (NSInteger deg = 0; deg <= 360; deg += 5) {
            
            UIColor *color;
            color = [UIColor colorWithHue:1.0 * deg / 360.0
                               saturation:1.0
                               brightness:1.0
                                    alpha:1.0];
            [_colors addObject:(id)[color CGColor]];
        }
    }
    return _colors;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
