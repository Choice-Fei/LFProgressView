//
//  LFProgressView.h
//  LFProgressViewDemo
//
//  Created by liufei on 2018/4/22.
//  Copyright © 2018年 liufei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LFProgressViewType) {
    /// 圆形
    LFProgressViewTypeCircle = 0,
    /// 水平
    LFProgressViewTypeHorizontal
};

@interface LFProgressView : UIView

/**
 进度
 */
@property (nonatomic, assign) CGFloat progress;

/**
 进度条宽度
 */
@property (nonatomic, assign) CGFloat progressWidth;

/**
 进度条类型，目前支持直线和圆形
 */
@property (nonatomic, assign) LFProgressViewType progressViewType;




@end
