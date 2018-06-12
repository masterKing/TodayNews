//
//  UIColor+Extension.m
//  WeiboOC
//
//  Created by Franky on 2017/12/11.
//  Copyright © 2017年 Franky. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

/**
 根据16进制返回颜色值
 
 @param hex 16进制颜色值 🌰: 0xFFC000
 @return UIColor对象
 */
+ (UIColor *)jw_colorWithHex:(UInt32)hex{
    UInt32 r = (hex & 0xFF0000) >> 16;
    UInt32 g = (hex & 0x00FF00) >> 8;
    UInt32 b = (hex & 0x0000FF);
    return [UIColor colorWithR:r G:g B:b];
}

+ (UIColor *)colorWithR:(UInt32)r G:(UInt32)g B:(UInt32)b{
    return [UIColor colorWithRed:(CGFloat)r / 255.0 green:(CGFloat)g / 255.0 blue:(CGFloat)b / 255.0 alpha:1];
}

/**
 返回随机颜色
 */
+ (UIColor *)jw_randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
}

/**
 是否是同一个颜色

 @param color UIColor对象
 @return 是否相同
 */
- (BOOL)jw_isTheSameColor:(UIColor *)color{
    return CGColorEqualToColor(self.CGColor, color.CGColor);
}

@end

