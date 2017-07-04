//
//  HMCommonFunctions.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/19.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMCommonFunctions : NSObject

//电话号码中间4位****显示
+ (NSString *)getSecrectStringWithPhoneNumber:(NSString *)phoneNum;

//转为电话格式
+ (NSString *)stringMobileFormat:(NSString *)mobile;

//银行卡号中间8位显示
+ (NSString *)getSecrectStringWithAccountNo:(NSString *)accountNo;

@end
