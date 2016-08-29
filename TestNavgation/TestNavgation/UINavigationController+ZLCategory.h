//
//  UINavigationController+ZLCategory.h
//  TestNavgation
//
//  Created by 廉鑫博 on 16/8/24.
//  Copyright © 2016年 zeroskylian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (ZLCategory)
/**
 *  标题颜色
 */
@property (strong, nonatomic) UIColor *titleColor;
/**
 *  标题字体大小
 */
@property (assign, nonatomic)NSInteger titleFontSize;
/**
 *  导航栏背景颜色
 */
@property (strong, nonatomic)UIColor *navBarBackgroundColor;

@end
