//
//  UIColor+Extension.h
//  WeiboOC
//
//  Created by Franky on 2017/12/11.
//  Copyright © 2017年 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 根据16进制返回颜色值

 @param hex 16进制颜色值 🌰: 0xFFC000
 @return UIColor对象
 */
+ (UIColor *)jw_colorWithHex:(UInt32)hex;

/**
 返回随机颜色
 */
+ (UIColor *)jw_randomColor;

/**
 是否是同一个颜色
 
 @param color UIColor对象
 @return 是否相同
 */
- (BOOL)jw_isTheSameColor:(UIColor *)color;

@end
