//
//  LZTabBar.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/11/3.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZTabBar.h"
@interface LZTabBar()

@property (nonatomic, weak) UIButton *button;

@end

@implementation LZTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self SetTabBarImage];
        
        UIButton *button = [[UIButton alloc] init];
        //设置背景
        [button setBackgroundImage:[UIImage imageNamed:@"tab_room"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tab_room_p"] forState:UIControlStateHighlighted];
        
        //设置图标
        //        [button setImage:[UIImage imageNamed:@"tab_room"] forState:UIControlStateNormal];
        //        [button setImage:[UIImage imageNamed:@"tab_room_p"] forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        self.button = button;
    }
    return self;
}

- (void)SetTabBarImage
{
    //    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    //
    //    UIGraphicsBeginImageContext(rect.size);
    //
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    //    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    //
    //    CGContextFillRect(context, rect);
    //
    //    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //
    //    UIGraphicsEndImageContext();
    //
    //    [self setBackgroundImage:img];
    //
    //    [self setShadowImage:img];
    //
    //    [self setBackgroundColor:[UIColor whiteColor]];
    //
    //    // 去除顶部横线
    //    //[self.tabBar setClipsToBounds:YES];
    //    self.opaque = YES;
    //隐藏阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    
    UIImageView* ivBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, -13, 320*kScreenScale, 60*kScreenScale)];
    [self addSubview:ivBackground];
    [ivBackground setImage:[UIImage imageNamed:@"tab_bg"]];
}


- (void)addButtonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didAddButton:)]) {
        
        [self.delegate tabBar:self didAddButton:button];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupTabBarItemFram];
    
    [self setupButtonFram];
    
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

//设置按钮的fram
- (void)setupButtonFram
{
    self.button.size = self.button.currentBackgroundImage.size;
    self.button.centerX = self.width * 0.5;
    
    if (iPhoneX) {
        self.button.centerY = (self.height - 34) * 0.5;
    }
    else{
        self.button.centerY = self.height * 0.5;
    }
}

- (void)setupTabBarItemFram
{
    int index = 0;
    
    for (UIControl *tabBarButton in self.subviews) {
        
        if(![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        if (index == 1) {
            [tabBarButton setEnabled:NO];
        }
        index ++;
    }
    
    //   for(UIView *tabarButton in self.subviews)
    //    {
    //        //
    //        if(![tabarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
    ////        NSLog(@"%d %@",index,tabarButton);
    //
    //        tabarButton.width = self.width / (self.items.count + 1);
    //        tabarButton.height = self.height;
    //        if (index >= 1)
    //        {
    //            tabarButton.left = tabarButton.width * (index+1);
    //        }
    //        else
    //        {
    //            tabarButton.left = tabarButton.width * index;
    //        }
    //
    //        tabarButton.y = 0;
    //        index++;
    //    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    //image作动画
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [UIView animateWithDuration:0.2 animations:
             ^(void){
                 
                 imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.5, 1.5);
                 
             } completion:^(BOOL finished){
                 
                 [UIView animateWithDuration:0.2 animations:
                  ^(void){
                      
                      imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
                      
                  } completion:^(BOOL finished){
                      
                      [UIView animateWithDuration:0.2 animations:
                       ^(void){
                           imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.3,1.3);
                       } completion:^(BOOL finished){
                           
                           [UIView animateWithDuration:0.2 animations:^{
                               imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                               
                           } completion:^(BOOL finished) {
                               
                               
                           }];
                           
                       }];
                  }];
             }];
        }
    }
    
    //Title作动画
    /*for (UILabel *titleLabel in tabBarButton.subviews) {
        if ([titleLabel isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
            [UIView animateWithDuration:0.1 animations:
             ^(void){
                 
                 titleLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
                 
             } completion:^(BOOL finished){
                 
                 [UIView animateWithDuration:0.2 animations:
                  ^(void){
                      
                      titleLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
                      
                  } completion:^(BOOL finished){
                      
                      [UIView animateWithDuration:0.1 animations:
                       ^(void){
                           titleLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                       } completion:^(BOOL finished){
                           
                       }];
                  }];
             }];
        }
    }*/
    
}

@end
