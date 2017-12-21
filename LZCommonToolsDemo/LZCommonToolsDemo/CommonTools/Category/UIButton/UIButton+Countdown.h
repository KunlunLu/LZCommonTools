//
//  UIButton+Countdown.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Countdown)
/**
 倒计时

 @param timeout 计时秒数
 @param tittle 提示文本
 @param waitTittle 计时文本
 */
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
