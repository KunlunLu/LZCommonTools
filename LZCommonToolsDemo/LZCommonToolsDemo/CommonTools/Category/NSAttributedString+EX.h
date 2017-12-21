//
//  NSAttributedString+EX.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (EX)

/**
 *  改变一个字符串指定字符的样式（颜色，大小等）
 *
 *  @param allStr        显示的字符串
 *  @param unChangePart  固定不变的部分
 *  @param changePart    需要改变的字符
 *  @param changeColor   需要改成的颜色
 *  @param changeFont    需要改成的大小
 *
 *  @return 经过改变的 NSAttributedString
 */

+ (NSAttributedString *)getAttributWithString:(NSString *)allStr UnChangePart:(NSString *)unChangePart changePart:(NSString *)changePart changeColor:(UIColor *)changeColor changeFont:(UIFont *)changeFont;

@end
