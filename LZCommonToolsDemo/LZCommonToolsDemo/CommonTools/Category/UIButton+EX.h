//
//  UIButton+EX.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/4.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (EX)

//点击按钮之后的动作
-(void)lz_addActionHandler:(TouchedBlock)touchHandler;

/**
 *  扩大 UIButton 的点击范围
 *  控制上下左右的延长范围
 *
 *  @param top    <#top description#>
 *  @param right  <#right description#>
 *  @param bottom <#bottom description#>
 *  @param left   <#left description#>
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
