//
//  UIColor+Hex.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/25.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b {
    return [UIColor colorWithR:r g:g b:b alpha:1.0];
}

+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:r / 255.0
                           green:g / 255.0
                            blue:b / 255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alphaValue];
}

+ (UIColor *)colorWithW:(NSInteger)w {
    return [UIColor colorWithW:w alpha:1.0];
}

+ (UIColor *)colorWithW:(NSInteger)w alpha:(CGFloat)alpha {
    return [UIColor colorWithWhite:w / 255.0 alpha:alpha];
}

+ (UIColor *) colorWithHexString:(NSString*) hexColor
{
    return  [self colorWithHexString:hexColor alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString*)hexColor alpha:(CGFloat)alpha {
    
    unsigned int red,green,blue;
    NSRange range;
    
    range.length = 2;
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    UIColor* retColor = [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:alpha];
    return retColor;
}

@end

@implementation UIColor (LaunchrApp)

+ (UIColor *)mainThemeColor{
    return [self colorWithHexString:@"3DCABA"];
}

//背景颜色
+ (UIColor *) commonBackgroundColor{
    return [self colorWithHexString:@"F0F0F0"];
}

//常规控件border颜色
+ (UIColor *) commonControlBorderColor{
    return [self colorWithHexString:@"dfdfdf"];
}

//常规字体颜色
+ (UIColor *) commonTextColor{
    return [self colorWithHexString:@"333333"];
}

//常规字体颜色
+ (UIColor *) commonLightGrayTextColor{
    return [self colorWithHexString:@"cccccc"];
}

//分割线颜色
+ (UIColor *) commonCuttingLineColor{
    return [self colorWithHexString:@"dfdfdf"];
}

+ (UIColor *) commonDarkGrayTextColor{
    return [self colorWithHexString:@"666666"];
}


+ (UIColor *) commonGrayTextColor{
    return [self colorWithHexString:@"999999"];
}

+ (UIColor *) commonBlueColor{
    return [self colorWithHexString:@"4AB0FF"];
}

+ (UIColor*) commonGreenColor{
    return [self colorWithHexString:@"2ECC71"];
}

//自定义橙色
+ (UIColor*) commonOrangeColor{
    return [self colorWithHexString:@"FFa63C"];
}

//自定义红紫色
+ (UIColor *) commonVioletColor{
    return [self colorWithHexString:@"FF6098"];
}

//自定义红色
+ (UIColor *) commonRedColor{
    return [self colorWithHexString:@"FF6666"];
}


@end
