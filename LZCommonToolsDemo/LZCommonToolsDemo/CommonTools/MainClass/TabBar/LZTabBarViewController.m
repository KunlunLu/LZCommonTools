//
//  LZTabBarViewController.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/11/3.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MiddleViewController.h"
#import "LZBaseNavigationController.h"
#import "LZTabBar.h"

@interface LZTabBarViewController ()<UITabBarControllerDelegate,LZTabBarDelegate>

@end

@implementation LZTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加所有的子控制器
    [self addAllChildVC];
    
    //创建自定义tabBar
    [self addCustomTabBar];
    
}

- (void)addCustomTabBar
{
    LZTabBar *customTabBar = [[LZTabBar alloc] init];
    
    customTabBar.frame = self.tabBar.bounds;
    
    customTabBar.delegate = self;
    //更换系统自带的tabBar
    [self setValue:customTabBar forKey:@"tabBar"];
}


- (void)tabBar:(LZTabBar *)tabBar didAddButton:(UIButton *)button
{
    //弹出控制器
    MiddleViewController *liveVC = [[MiddleViewController alloc] init];
    [self presentViewController:liveVC animated:YES completion:nil];
}

- (void)addAllChildVC
{
    //在IOS7中，会对selectedImage的图片进行再次渲染为蓝色
    //要想显示原图，就必须告诉它，不要渲染
    
    //主页
    FirstViewController *homeVC = [[FirstViewController alloc] init];
    [self addOneChildVC:homeVC tabBarTitle:@"首页" navTitle:@"首页" imagedName:@"tab_live" selectedImageName:@"tab_live_p"];
    
    //直播
    MiddleViewController *liveVC = [[MiddleViewController alloc] init];
    [self addOneChildVC:liveVC tabBarTitle:nil navTitle:nil imagedName:nil selectedImageName:nil];
    
    //我
    SecondViewController *meVC = [[SecondViewController alloc] init];
    [self addOneChildVC:meVC tabBarTitle:@"个人中心" navTitle:@"个人中心" imagedName:@"tab_me" selectedImageName:@"tab_me_p"];
    
    self.delegate = self;
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    tabBarController.tabBar.tintColor = [UIColor mainThemeColor];
    //[self changeTextColorInTabBarButton];
    
    //强制重新布局子控件
    [self.tabBar setNeedsDisplay];
}

- (void)addOneChildVC:(UIViewController *)childVC tabBarTitle:(NSString *)tabBarTitle navTitle:(NSString *)navTitle imagedName:(NSString *)imagedName selectedImageName:(NSString *)selectedImageName
{
    childVC.tabBarItem.title = tabBarTitle;
    childVC.navigationItem.title = navTitle;
    
    UIImage *imaged = [UIImage imageNamed:imagedName];
    childVC.tabBarItem.image = [imaged imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    //声明这张图片用原图（不要渲染）
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImage;
    
     LZBaseNavigationController *nav = [[LZBaseNavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
}


@end
