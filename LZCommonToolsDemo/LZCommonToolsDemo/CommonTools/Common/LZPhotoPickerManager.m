//
//  LZPhotoPickerManager.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/7/31.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZPhotoPickerManager.h"

static LZPhotoPickerManager *pickerManager;

@interface LZPhotoPickerManager ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imgPickController;
@property (nonatomic, copy) CallBackBlock selectImageBlock;

@end

@implementation LZPhotoPickerManager

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pickerManager = [[LZPhotoPickerManager alloc] init];
    });
    return pickerManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (!_imgPickController) {
            _imgPickController = [[UIImagePickerController alloc] init];
            _imgPickController.allowsEditing = YES;
            _imgPickController.delegate = self;
        }
    }
    return self;
}

- (void)addTarget:(UIViewController *)viewController showImageViewSelcteWithResultBlock:(CallBackBlock)selectImageBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet] ;
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //相机拍摄
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            [self creatWithSourceType:UIImagePickerControllerSourceTypeCamera target:viewController block:selectImageBlock];
        }
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self creatWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary target:viewController block:selectImageBlock];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从图库选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self creatWithSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum target:viewController block:selectImageBlock];
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [viewController presentViewController:alertController animated:YES completion:nil];
}

- (void)creatWithSourceType:(UIImagePickerControllerSourceType)sourceType target:(UIViewController *)viewController block:selectImageBlock{
    
    _imgPickController.sourceType = sourceType;
    _selectImageBlock = selectImageBlock;
    [viewController presentViewController:_imgPickController animated:YES completion:nil];
}

#pragma mark ---- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    NSLog(@"%@",info);
    
    UIImage *theImage = nil;
    // 判断，图片是否允许修改。默认是可以的
    if ([picker allowsEditing]){
        theImage = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
        theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
    if (_selectImageBlock) {
        _selectImageBlock(theImage);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
