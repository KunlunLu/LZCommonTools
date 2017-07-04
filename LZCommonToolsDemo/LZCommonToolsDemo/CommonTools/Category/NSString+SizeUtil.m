//
//  NSString+SizeUtil.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/17.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "NSString+SizeUtil.h"

@implementation NSString (SizeUtil)

- (CGSize)boundingRectWithSize:(CGSize)size withFond:(UIFont*) font
{
    CGSize textSize = CGSizeZero;
    
    NSStringDrawingOptions opts = NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGRect rect = [self boundingRectWithSize:size
                                         options:opts
                                      attributes:attribute
                                         context:nil];

    textSize = rect.size;
    
    return textSize;
}

- (float)widthSystemFontOfSize:(CGFloat)fontSize
{
    return [self widthSystemFont: [UIFont systemFontOfSize: fontSize]];
}

- (float)widthSystemFont:(UIFont *)font
{
    CGSize sizeContent = CGSizeMake(MAXFLOAT, font.xHeight);
    CGSize sizeWidth = [self boundingRectWithSize:sizeContent withFond:font];
    return sizeWidth.width;
}

- (float)heightSystemFontOfSize:(float)fontSize width:(CGFloat)width
{
    return [self heightSystemFont: [UIFont systemFontOfSize: fontSize] width: width];
}

- (float)heightSystemFont:(UIFont *)font width:(CGFloat)width
{
    CGSize sizeContent = CGSizeMake(width, MAXFLOAT);
    CGSize sizeHeight = [self boundingRectWithSize:sizeContent withFond:font];
    
    return sizeHeight.height;
}


/*
 lineSpacing           //行间距
 paragraphSpacing      //段落间距
 alignment             //文字对齐格
 firstLineHeadIndent   //首行缩进
 headIndent            //行首缩进
 tailIndent            //行尾缩进
 lineBreakMode         //段落文字溢
 */
- (float)heightSystemFont:(UIFont *)font width:(CGFloat)width lineSpace:(CGFloat)space
{
    CGSize textSize = CGSizeZero;
    
    CGSize sizeContent = CGSizeMake(width, MAXFLOAT);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    
    //调整行间距
    [style setLineSpacing:space];
    
    //截断内容格式 abc...
    [style setLineBreakMode:NSLineBreakByTruncatingTail];
    
    NSDictionary *attribute = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:style};
    
    NSStringDrawingOptions opts = NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGRect rect = [self boundingRectWithSize:sizeContent
                                        options:opts
                                     attributes:attribute
                                        context:nil];

    textSize = rect.size;
    
    return textSize.height;
}

@end
