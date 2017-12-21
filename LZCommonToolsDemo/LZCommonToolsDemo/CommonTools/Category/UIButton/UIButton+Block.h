//
//  UIButton+Block.h
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TouchedBlock)(NSInteger tag);

@interface UIButton (Block)

-(void)addActionHandler:(TouchedBlock)touchHandler;

@end
