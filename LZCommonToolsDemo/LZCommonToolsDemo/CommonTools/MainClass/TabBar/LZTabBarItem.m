//
//  LZTabBarItem.m
//  LZCommonToolsDemo
//
//  Created by lkl on 2017/11/3.
//  Copyright © 2017年 lkl. All rights reserved.
//

#import "LZTabBarItem.h"
#import <objc/runtime.h>

@implementation LZTabBarItem

- (void)setBadgeValue:(NSString *)badgeValue
{
    [super setBadgeValue:badgeValue];
    
    if (badgeValue == nil) {
        return;
    }
    
    //    tabBar.subviews ==> UITabBarButton ==> _UIBadgeView ==> _UIBadgeBackground
    UITabBarController *tabBarVc = [self valueForKey:@"_target"];
    
    for (UIView *tabBarButton in tabBarVc.tabBar.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            for (UIView *badgeView in tabBarButton.subviews) {
                
                if ([badgeView isKindOfClass:NSClassFromString(@"_UIBadgeView")]) {
                    
                    for (UIView *BadgeBackground in badgeView.subviews) {
                        
                        if ([BadgeBackground isKindOfClass:NSClassFromString(@"_UIBadgeBackground")]) {
                            
                            unsigned int count;
                            
                            Ivar *vars = class_copyIvarList(NSClassFromString(@"_UIBadgeBackground"), &count);
                            
                            for (int i = 0; i < count; i++) {
                                
                                Ivar var = vars[i];
                                NSString *name = [NSString stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding];
                                //                                NSString *type = [NSString stringWithCString:ivar_getTypeEncoding(var) encoding:NSUTF8StringEncoding];
                                //
                                //                                NSLog(@"%@------%@",name,type);
                                
                                if ([name isEqualToString:@"_image"]) {
                                    [BadgeBackground setValue:[UIImage imageNamed:@"main_badge"] forKey:name];
                                }
                            }
                            
                            free(vars);
                            
                        }
                    }
                    
                }
            }
        }
    }
}

@end
