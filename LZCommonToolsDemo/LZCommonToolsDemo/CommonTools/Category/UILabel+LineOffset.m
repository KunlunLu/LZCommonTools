//
//  UILabel+LineOffset.m
//  LZCommonUtilKits
//
//  Created by lkl on 2017/4/17.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "UILabel+LineOffset.h"

@implementation UILabel (LineOffset)

/*
 lineSpacing           //行间距
 paragraphSpacing      //段落间距
 alignment             //文字对齐格
 firstLineHeadIndent   //首行缩进
 headIndent            //行首缩进
 tailIndent            //行尾缩进
 lineBreakMode         //段落文字溢
 */

-(void)setText:(NSString*)str lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentJustified;  //ziw
    
    paraStyle.lineSpacing = lineSpacing; //设置行间距
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:[NSNumber numberWithFloat:1]
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    
    self.attributedText = attributeStr;
}

@end
