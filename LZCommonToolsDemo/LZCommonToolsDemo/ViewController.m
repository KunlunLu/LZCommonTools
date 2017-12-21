//
//  ViewController.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/4.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "ViewController.h"
#import "LZCommonTools.h"
#import "UIBarButtonItem+Action.h"
#import "UIView+BlockGesture.h"
#import "UIView+Animation.h"
#import "LZPlaceholderTextView.h"
#import "UIView+Toast.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *clickBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSHomeDirectory());

    [self.view makeToast:@"fdad"];
    [self.view makeToast:@"dfdf" duration:1 position:@"center" title:@"tishi" image:[UIImage imageNamed:@"df"]];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setLeftBarButtonItem:item];
    [item setActionBlock:^{
        NSLog(@"adfdsf");
    }];
    
    UILabel *testlabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 450, self.view.frame.size.width-20, 20)];
    [self.view addSubview:testlabel];
    [testlabel setTextColor:[UIColor lightGrayColor]];
    [testlabel setAttributedText:[NSAttributedString getAttributWithString:@"正在测试字体颜色改变的方法" UnChangePart:@"正在测试字体颜色改变的方法" changePart:@"字体颜" changeColor:[UIColor orangeColor] changeFont:[UIFont systemFontOfSize:14]]];
    [testlabel setUserInteractionEnabled:YES];
    [testlabel addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        NSLog(@"dfasdfds");
    }];
    [testlabel moveTo:CGPointMake(10, 60) duration:5 option:UIViewAnimationOptionCurveEaseIn];
    
    UIButton *countButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 150, 45)];
    [self.view addSubview:countButton];
    [countButton.layer setCornerRadius:countButton.height/2];
    [countButton.layer setMasksToBounds:YES];
    [countButton setBackgroundColor:[UIColor orangeColor]];
    [countButton setTitle:@"获取验证码" forState:UIControlStateNormal];

    __weak typeof(UIButton) *buttonSelf = countButton;
    [countButton lz_addActionHandler:^(NSInteger tag) {
        NSLog(@"%ld",tag);
        [buttonSelf startTime:10.0f title:@"获取验证码" waitTittle:@"秒"];
    }];
    
    self.clickBtn.frame = CGRectMake(10, 260, 150, 45);
    [self.view addSubview:self.clickBtn];
    
    
    [self.clickBtn lz_addActionHandler:^(NSInteger tag) {
        [[LZPhotoPickerManager shareInstance] addTarget:self showImageViewSelcteWithResultBlock:^(UIImage *img) {
            
            NSLog(@"%@",img);
        }];
    }];
    
    
    LZPlaceholderTextView *textView= [[LZPlaceholderTextView alloc]init];
    textView.frame = CGRectMake(100, 100, 200, 100);
    textView.font = [UIFont systemFontOfSize:15];
    textView.placeholderString = @"请简单描述一餐如：一个鸡蛋";
    // 动态更改高度
//    textView.isChangeHeight = YES;
    textView.textColor = [UIColor blackColor];
    [self.view addSubview:textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- init
- (UIButton *)clickBtn{
    if (!_clickBtn) {
        _clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickBtn setTitle:@"选择照片" forState:UIControlStateNormal];
        [_clickBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_clickBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_clickBtn setBackgroundColor:[UIColor orangeColor]];
        [_clickBtn showBottomLine];
    }
    return _clickBtn;
}

@end
