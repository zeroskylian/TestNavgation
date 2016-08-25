//
//  RedViewController.m
//  TestNavgation
//
//  Created by 廉鑫博 on 16/8/24.
//  Copyright © 2016年 zeroskylian. All rights reserved.
//

#import "RedViewController.h"

@implementation RedViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
-(void)popToRoot
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
