//
//  UIBarButtonItem+BackEXtension.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/25.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "UIBarButtonItem+BackEXtension.h"

@implementation UIBarButtonItem (BackEXtension)

+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)imageNamed targe:(id)targe action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    
    [button addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
