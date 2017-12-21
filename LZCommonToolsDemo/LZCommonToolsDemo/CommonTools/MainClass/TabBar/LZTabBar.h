//
//  LZTabBar.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/11/3.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZTabBar;

@protocol LZTabBarDelegate <NSObject,UITabBarDelegate>

- (void)tabBar:(LZTabBar *)tabBar didAddButton:(UIButton *)button;

@end

@interface LZTabBar : UITabBar

//消除警告  delegate跟系统的名字一样
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wobjc-property-synthesis"

@property (nonatomic,weak)id <LZTabBarDelegate> delegate;

#pragma clang diagnostic pop


@end
