//
//  UIViewController+ShowAlert.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/3/29.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "UIViewController+ShowAlert.h"

@implementation UIViewController (ShowAlert)

- (void) showAlertMessage:(NSString*) msg
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlertMessage:(NSString *)msg confrimClicked:(void(^)())confirmBlock cancelClicked:(void(^)())cancelBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock)
        {
            cancelBlock();
        }
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlertMessage:(NSString *)msg cancelTitle:(NSString *)cancelTitle cancelClicked:(void(^)())cancelClicked confirmTitle:(NSString *)confirmTitle confirmClicked:(void(^)())confirmClicked {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelClicked) {
            cancelClicked();
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (confirmClicked) {
            confirmClicked();
        }
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
