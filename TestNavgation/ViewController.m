//
//  ViewController.m
//  TestNavgation
//
//  Created by zeoskylian on 16/8/22.
//  Copyright © 2016年 zeroskylian. All rights reserved.
//

#import "ViewController.h"

#import "RedViewController.h"
#import "UINavigationController+ZLCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"121";
    self.navigationController.titleColor = [UIColor redColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"red" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushToRedVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)pushToRedVC
{
    RedViewController *red = [[RedViewController alloc]init];
    [self.navigationController pushViewController:red animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
