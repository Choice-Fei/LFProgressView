//
//  UIView+Extension.m
//  LFProgressViewDemo
//
//  Created by liufei on 2018/4/22.
//  Copyright © 2018年 liufei. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (CGFloat)LF_x {
    return self.frame.origin.x;
}
- (CGFloat)LF_y {
    return self.frame.origin.y;
}
- (CGFloat)LF_right {
    return self.LF_x  + self.LF_width;
}
- (CGFloat)LF_width {
    return self.frame.size.width;
}
- (CGFloat)LF_height {
    return self.frame.size.height;
}
- (CGFloat)LF_bottom {
   return  self.LF_y + self.LF_height;
}
@end
