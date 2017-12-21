//
//  UIButton+LZButton.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LZButton)

//快速创建按钮
+(instancetype)lz_buttonWithTitle:(NSString *)title backColor:(UIColor *)backColor backImageName:(NSString *)backImageName titleColor:(UIColor *)color fontSize:(int)fontSize frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius;

@end
