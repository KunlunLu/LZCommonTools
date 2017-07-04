//
//  HMCommonFunctions.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/19.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "HMCommonFunctions.h"
#import "HMValidateFuncs.h"

@implementation HMCommonFunctions

+ (NSString *)getSecrectStringWithPhoneNumber:(NSString *)phoneNum
{
    if (![HMValidateFuncs isValidMobileNumber:phoneNum]) {
        return @"无效手机号";
    }
    NSMutableString *newStr = [NSMutableString stringWithString:phoneNum];
    NSRange range = NSMakeRange(3, 4);
    [newStr replaceCharactersInRange:range withString:@"****"];
    return newStr;
}

+ (NSString *)stringMobileFormat:(NSString *)mobile
{
    if (![HMValidateFuncs isValidMobileNumber:mobile]) {
        return @"无效手机号";
    }
    NSMutableString* value = [[NSMutableString alloc] initWithString:mobile];
    [value insertString:@"-" atIndex:3];
    [value insertString:@"-" atIndex:8];
    return value;
}

+ (NSString *)getSecrectStringWithAccountNo:(NSString *)accountNo
{
    if (![HMValidateFuncs isValidIDCardNumber:accountNo]) {
        return @"无效银行卡号";
    }
    NSMutableString *newStr = [NSMutableString stringWithString:accountNo];
    NSRange range = NSMakeRange(4, 8);
    if (newStr.length>12) {
        [newStr replaceCharactersInRange:range withString:@" **** **** "];
    }
    return newStr;
    
}
@end
