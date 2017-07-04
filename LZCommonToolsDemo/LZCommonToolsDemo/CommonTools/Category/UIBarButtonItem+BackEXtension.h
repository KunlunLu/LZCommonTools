//
//  UIBarButtonItem+BackEXtension.h
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/25.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BackEXtension)

+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)imageNamed targe:(id)targe action:(SEL)action;

@end
