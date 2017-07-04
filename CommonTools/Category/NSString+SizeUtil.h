//
//  NSString+SizeUtil.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/17.
//  Copyright © 2017年 lkl. All rights reserved.
//  求高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SizeUtil)

- (float)widthSystemFontOfSize:(CGFloat)fontSize;

- (float)widthSystemFont:(UIFont *)font;

- (float)heightSystemFont:(UIFont *)font width:(CGFloat)width;

- (float)heightSystemFontOfSize:(float)fontSize width:(CGFloat)width;

- (float)heightSystemFont:(UIFont *)font width:(CGFloat)width lineSpace:(CGFloat)space;

@end
