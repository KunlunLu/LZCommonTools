//
//  LZDeviceInfoMacro.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#ifndef LZDeviceInfoMacro_h
#define LZDeviceInfoMacro_h

// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)

//获取屏幕宽度与高度
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenScale kScreenWidth / 320

//APP版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 设备系统版本 > 7.0
#define IOS_VERSION_7_OR_ABOVE  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_VERSION_8_OR_ABOVE  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS_VERSION_9_OR_ABOVE  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

// 判断设备为哪种型号
#define IOS_DEVICE_6        ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IOS_DEVICE_5        ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IOS_DEVICE_4        ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )
#define IOS_DEVICE_6Plus    ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )

// UUID
#define IOS_DEVICE_UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

// TYPE
#define IOS_DEVICE_TYPE [[UIDevice currentDevice] model]

// SYSTEM_NAME
//#define IOS_SYSTEM_NAME [[UIDevice currentDevice] systemName]
#define IOS_SYSTEM_NAME @"iOS"

#define APP_STATUSBAR_HEIGHT                (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))

// 高度栏
#define Y_STATUSBAR_IOS7 64
#define Y_STATUSBAR_IOS6 44


#endif /* LZDeviceInfoMacro_h */
