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
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"root" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = leftBarBtn;
}
-(void)popToRoot
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
