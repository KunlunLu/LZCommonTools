//
//  HMCommonFunctions.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/19.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMCommonFunctions : NSObject

/**
 电话号码中间4位****显示

 @param phoneNum 电话号码
 @return 字符串
 */
+ (NSString *)getSecrectStringWithPhoneNumber:(NSString *)phoneNum;


/**
 转为电话格式

 @param mobile 电话号码
 @return 字符串
 */
+ (NSString *)stringMobileFormat:(NSString *)mobile;


/**
 银行卡号中间8位显示

 @param accountNo 银行卡号
 @return 银行卡号显示
 */
+ (NSString *)getSecrectStringWithAccountNo:(NSString *)accountNo;

@end
