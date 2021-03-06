//
//  LZKeyboardShowHiddenNotificationCenter.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZKeyboardShowHiddenNotificationCenter.h"

@implementation LZKeyboardShowHiddenNotificationCenter

- (void)closeCurrentNotification{
    self.delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


+ (LZKeyboardShowHiddenNotificationCenter *)defineCenter{
    static LZKeyboardShowHiddenNotificationCenter * center = nil;
    if (center == nil) {
        center = [[LZKeyboardShowHiddenNotificationCenter alloc] init];
        center.delegate = nil;
        
        [[NSNotificationCenter defaultCenter] addObserver:center selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:center selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    return center;
}

/*- (void)setDelegate:(id<KLKeyboardShowHiddenNotificationCenterDelegate>)delegate{
 _delegate = delegate;
 
 //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
 //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
 }*/


- (void)keyboardWillShow:(NSNotification *)notification {
    
    // 获取通知的信息字典
    NSDictionary *userInfo = [notification userInfo];
    
    // 获取键盘弹出后的rect
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    
    // 获取键盘弹出动画时间
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    
    // 检查代理是否为空
    if ([self isBlanceObject:self.delegate]) {
        return;
    }
    
    // 调用代理
    if ([self.delegate respondsToSelector:@selector(showOrHiddenKeyboardWithHeight:withDuration:isShow:)]) {
        [self.delegate showOrHiddenKeyboardWithHeight:keyboardRect.size.height withDuration:animationDuration isShow:YES];
    }
}


- (void)keyboardWillHide:(NSNotification *)notification {
    
    // 获取通知信息字典
    NSDictionary* userInfo = [notification userInfo];
    
    // 获取键盘隐藏动画时间
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    
    // 检查代理是否为空
    if ([self isBlanceObject:self.delegate]) {
        return;
    }
    
    // 调用代理
    if ([self.delegate respondsToSelector:@selector(showOrHiddenKeyboardWithHeight:withDuration:isShow:)]) {
        [self.delegate showOrHiddenKeyboardWithHeight:0.0 withDuration:animationDuration isShow:NO];
    }
}

// 判断对象是否为空
- (BOOL)isBlanceObject:(id)object{
    if (object == nil || object == NULL) {
        return YES;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

@end
