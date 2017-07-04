//
//  UIColor+Hex.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/25.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b;
+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

+ (UIColor *)colorWithW:(NSInteger)w;
+ (UIColor *)colorWithW:(NSInteger)w alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexColor;
+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha;

@end

@interface UIColor (LaunchrApp)

//主题颜色
+ (UIColor *)mainThemeColor;

//背景颜色
+ (UIColor *)commonBackgroundColor;

//常规控件border颜色
+ (UIColor *)commonControlBorderColor;

//常规字体颜色
+ (UIColor *)commonTextColor;

//常规浅色字体颜色
+ (UIColor *)commonLightGrayTextColor;

+ (UIColor *)commonDarkGrayTextColor;

//分割线颜色
+ (UIColor *)commonCuttingLineColor;

+ (UIColor *)commonGrayTextColor;

//自定义蓝色
+ (UIColor *)commonBlueColor;

//自定义绿色
+ (UIColor *)commonGreenColor;

//自定义橙色
+ (UIColor *)commonOrangeColor;

//自定义紫色
+ (UIColor *)commonVioletColor;

//自定义红色
+ (UIColor *)commonRedColor;

@end
