//
//  UIView+EX.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/18.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EX)

// 标识，类名string
+ (NSString *)lz_identifier;

- (void)showTopLine;
- (void)showBottomLine;
- (void)showLeftLine;
- (void)showRightLine;

@end
