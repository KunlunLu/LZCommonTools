//
//  LZBaseNavigationController.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/11/3.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZBaseNavigationController.h"

@interface LZBaseNavigationController ()

@end

@implementation LZBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setBarTintColor:[UIColor mainThemeColor]];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{   //拦截所有push进来的子控制器
    if(self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageNamed:@"back.png" targe:self action:@selector(backUp)];
        
    }
    [super pushViewController:viewController animated:animated];
    
}

- (void)backUp
{
    [self popViewControllerAnimated:YES];
}


@end
