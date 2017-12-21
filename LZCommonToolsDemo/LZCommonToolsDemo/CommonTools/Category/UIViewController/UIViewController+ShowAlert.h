//
//  UIViewController+ShowAlert.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/3/29.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowAlert)

- (void)showAlertMessage:(NSString *)msg;

- (void)showAlertMessage:(NSString *)msg confrimClicked:(void(^)())confirmBlock cancelClicked:(void(^)())cancelBlock;

- (void)showAlertMessage:(NSString *)msg cancelTitle:(NSString *)cancelTitle cancelClicked:(void(^)())cancelClicked confirmTitle:(NSString *)confirmTitle confirmClicked:(void(^)())confirmClicked;

@end
