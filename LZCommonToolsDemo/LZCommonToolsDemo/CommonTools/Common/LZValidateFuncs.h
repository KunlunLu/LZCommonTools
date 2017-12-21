//
//  LZValidateFuncs.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZValidateFuncs : NSObject

/**
 *  验证是固话或者手机号
 *
 *  @param mobileNum 手机号
 *
 *  @return 是否
 */
+ (BOOL)isMobilePhoneOrtelePhone:(NSString *)mobileNum;


/**
 *  手机号码是否有效
 *
 *  @param mobile 手机号
 *
 *  @return 是否
 */
+ (BOOL)isValidMobileNumber:(NSString *)mobile;


/**
 *  验证身份证号是否合法
 *
 *  @param value 手机号
 *
 *  @return 是否
 */
+ (BOOL)isValidIDCardNumber:(NSString *)value;

@end
