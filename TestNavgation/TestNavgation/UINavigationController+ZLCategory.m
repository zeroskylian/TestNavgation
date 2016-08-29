//
//  UINavigationController+ZLCategory.m
//  TestNavgation
//
//  Created by 廉鑫博 on 16/8/24.
//  Copyright © 2016年 zeroskylian. All rights reserved.
//

#import "UINavigationController+ZLCategory.h"

#import <objc/runtime.h>

static void *kZLNavgationSize = @"kZLNavgationSize";

static void *kZLNavgationColor = @"kZLNavgationColor";

static void *kZLNavgationbackgroundColor = @"kZLNavgationbackgroundColor";

@implementation UINavigationController (ZLCategory)


-(void)setTitleFontSize:(NSInteger)titleFontSize
{
    objc_setAssociatedObject(self, &kZLNavgationSize, @(titleFontSize), OBJC_ASSOCIATION_ASSIGN);
   [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:titleFontSize]}];
}

-(NSInteger)titleFontSize
{
    return [objc_getAssociatedObject(self, &kZLNavgationSize) integerValue];
}

-(void)setTitleColor:(UIColor *)titleColor
{
    objc_setAssociatedObject(self, &kZLNavgationColor, titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
}

-(UIColor *)titleColor
{
    return  objc_getAssociatedObject(self, &kZLNavgationColor);
}

-(void)setNavBarBackgroundColor:(UIColor *)navBarBackgroundColor
{
    objc_setAssociatedObject(self, &kZLNavgationbackgroundColor, navBarBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.navigationBar.barTintColor = navBarBackgroundColor;
    
}

-(UIColor *)navBarBackgroundColor
{
    return objc_getAssociatedObject(self, &kZLNavgationbackgroundColor);
}
@end





