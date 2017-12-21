//
//  LZKeyboardShowHiddenNotificationCenter.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LZKeyboardShowHiddenNotificationCenterDelegate <NSObject>


/**
 键盘弹出

 @param height 高度
 @param animationDuration 时间
 @param isShow 是否显示
 */
- (void)showOrHiddenKeyboardWithHeight:(CGFloat)height withDuration:(CGFloat)animationDuration isShow:(BOOL)isShow;

@end

@interface LZKeyboardShowHiddenNotificationCenter : NSObject

+ (LZKeyboardShowHiddenNotificationCenter *)defineCenter;

@property (nonatomic,assign) id <LZKeyboardShowHiddenNotificationCenterDelegate> delegate;

// 在对象dealloc时候调用
- (void)closeCurrentNotification;

@end
