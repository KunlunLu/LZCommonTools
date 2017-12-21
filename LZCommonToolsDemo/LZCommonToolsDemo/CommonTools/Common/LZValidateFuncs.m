//
//  LZValidateFuncs.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZValidateFuncs.h"

@implementation LZValidateFuncs

/**
 *  验证是固话或者手机号
 *
 *  @param mobileNum 手机号
 *
 *  @return 是否
 */
+ (BOOL)isMobilePhoneOrtelePhone:(NSString *)mobileNum {
    if (mobileNum==nil || mobileNum.length ==0) {
        return NO;
    }
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^((13)|(14)|(15)|(17)|(18))\\d{9}$";// @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^((0\\d{2,3}-?)\\d{7,8}(-\\d{2,5})?)$";// @"^0(10|2[0-5789]-|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestPHS evaluateWithObject:mobileNum]==YES)) {
        return YES;
    }
    else{
        return NO;
    }
}

+ (BOOL)isValidMobileNumber:(NSString *) mobile
{
    BOOL valid = NO;
    
    if (!mobile || ![mobile isKindOfClass:[NSString class]]) {
        return valid;
    }
    
    if (11 != mobile.length)
    {
        return valid;
    }
    
    NSString* mobHeader = [mobile substringWithRange:NSMakeRange(0, 1)];
    if (!mobHeader || ![mobHeader isEqualToString:@"1"])
    {
        return valid;
    }
    
    /**
     * 移动号段正则表达式
     */
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     * 联通号段正则表达式
     */
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     * 电信号段正则表达式
     */
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
    
    if (isMatch1 || isMatch2 || isMatch3) {
        valid = YES;
    }
    //valid = YES;
    return valid;
}

/**
 *  验证身份证号是否合法
 *
 *  @param value 手机号
 *
 *  @return 是否
 */
+ (BOOL)isValidIDCardNumber:(NSString *)value
{
    if (!value || 15 > value.length)
    {
        return NO;
    }
    
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value)
    {
        
        return NO;
        
    }else {
        length = (int)value.length;
        if (length !=15 && length !=18)
        {
            return NO;
        }
        
    }
    
    // 省份代码
    
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    NSString *valueStart2 = [value substringToIndex:2];
    
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray)
    {
        if ([areaCode isEqualToString:valueStart2])
        {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag)
    {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    
    switch (length)
    {
            
        case 15:
        {
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0))
            {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                
            }else
            {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0){
                return YES;
                
            }else {
                return NO;
            }
        }
            break;
            
        case 18:
        {
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                
            }else {
                
                //regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{4}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            
            numberofMatch = [regularExpression numberOfMatchesInString:value options:NSMatchingReportProgress range:NSMakeRange(0, value.length)];
            
            if(numberofMatch > 0)
            {
                
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                
                int Y = S % 11;
                
                NSString *M =@"F";
                
                NSString *JYM =@"10X98765432";
                
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    
                    return YES;// 检测ID的校验位
                    
                }else {
                    
                    return NO;
                    
                }
                
                
            }else {
                
                return NO;
                
            }
        }
            break;
        default:
            
            return NO;
            
    }
    
}


@end
