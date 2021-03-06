//
//  UIViewController+EX.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EX)

/** 找到当前视图控制器 */
+ (UIViewController *)lz_currentViewController;

/** 找到当前导航控制器 */
+ (UINavigationController *)lz_currentNavigatonController;

/**
 * 在当前视图控制器中添加子控制器，将子控制器的视图添加到 view 中
 *
 * @param childController 要添加的子控制器
 * @param view            要添加到的视图
 */
- (void)lz_addChildController:(UIViewController *)childController intoView:(UIView *)view;

@end
