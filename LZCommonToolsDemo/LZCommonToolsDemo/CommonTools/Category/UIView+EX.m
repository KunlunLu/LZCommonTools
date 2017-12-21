//
//  UIView+EX.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/18.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "UIView+EX.h"
#import "UIColor+Hex.h"

@implementation UIView (EX)

+ (NSString *)lz_identifier {
    return NSStringFromClass([self class]);
}

- (void)showTopLine
{
    UIImageView *ivTopLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.5)];
    [self addSubview:ivTopLine];
    [ivTopLine setBackgroundColor:[UIColor colorWithHex:0xE2E2E2]];
}

- (void)showBottomLine
{
    UIImageView *ivBottomLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5)];
    [self addSubview:ivBottomLine];
    [ivBottomLine setBackgroundColor:[UIColor colorWithHex:0xE2E2E2]];
}

- (void) showLeftLine
{
    UIImageView *ivLeftLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0.5, CGRectGetHeight(self.frame))];
    [self addSubview:ivLeftLine];
    [ivLeftLine setBackgroundColor:[UIColor colorWithHex:0xE2E2E2]];
}

- (void) showRightLine
{
    UIImageView *ivRightLine = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 0.5, 0, 0.5, CGRectGetHeight(self.frame))];
    [self addSubview:ivRightLine];
    [ivRightLine setBackgroundColor:[UIColor colorWithHex:0xE2E2E2]];
}

@end
