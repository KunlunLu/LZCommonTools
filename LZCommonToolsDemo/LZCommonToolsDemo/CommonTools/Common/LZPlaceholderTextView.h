//
//  LZPlaceholderTextView.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/9/7.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZPlaceholderTextView : UITextView

/**
 占位的字符串 default is 请输入
 */
@property (nonatomic, copy) NSString * placeholderString;

/**
 占位符的颜色 default is darkGrayColor
 */
@property (nonatomic, strong) UIColor * placeholderColor;

/**
 动态更改高度 default is NO
 */
@property (nonatomic,assign) BOOL isChangeHeight;

@end
