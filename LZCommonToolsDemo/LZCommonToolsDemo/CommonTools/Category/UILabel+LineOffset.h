//
//  UILabel+LineOffset.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/17.
//  Copyright © 2017年 lkl. All rights reserved.
//  设置文本的间距

#import <UIKit/UIKit.h>

@interface UILabel (LineOffset)

- (void)setText:(NSString*)str lineSpacing:(CGFloat)lineSpacing;

@end
