//
//  HMValidateFuncs.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/19.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMValidateFuncs : NSObject

//手机号码是否有效
+ (BOOL)isValidMobileNumber:(NSString *)mobile;

//验证身份证号是否合法
+ (BOOL)isValidIDCardNumber:(NSString *)value;

+ (BOOL)isInteger:(float) fValue;

@end
