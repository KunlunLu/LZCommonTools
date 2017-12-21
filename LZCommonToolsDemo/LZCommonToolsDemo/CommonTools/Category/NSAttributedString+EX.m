//
//  NSAttributedString+EX.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "NSAttributedString+EX.h"

@implementation NSAttributedString (EX)

+ (NSAttributedString *)getAttributWithString:(NSString *)allStr UnChangePart:(NSString *)unChangePart changePart:(NSString *)changePart changeColor:(UIColor *)changeColor changeFont:(UIFont *)changeFont{
    
    NSRange changePartRange = [allStr rangeOfString:changePart];
    NSMutableAttributedString *allAttStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    if (changeColor) {
        [allAttStr addAttribute:NSForegroundColorAttributeName value:changeColor range:changePartRange];
    }
    if (changeFont) {
        [allAttStr addAttribute:NSFontAttributeName value:changeFont range:changePartRange];
    }
    return allAttStr;
}

@end
