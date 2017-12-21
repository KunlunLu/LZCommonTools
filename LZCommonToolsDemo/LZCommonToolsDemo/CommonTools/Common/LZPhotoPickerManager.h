//
//  LZPhotoPickerManager.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CallBackBlock)(UIImage *img);  // 回调

@interface LZPhotoPickerManager : NSObject

+ (instancetype)shareInstance; // 单例

- (void)addTarget:(UIViewController *)viewController showImageViewSelcteWithResultBlock:(CallBackBlock)selectImageBlock;

@end
