//
//  ZLNavgationController.m
//  testTableView
//
//  Created by zeoskylian on 16/8/16.
//  Copyright © 2016年 KXRT. All rights reserved.
//

#import "ZLNavgationController.h"

@interface ZLNavgationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic , weak)UIViewController *rootViewController;
@end

@implementation ZLNavgationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.rootViewController = rootViewController;
    }
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    /**
     *  如果没重写nav的返回按钮，则系统默认会设置delegate
     *  在这里设置 或者在push里设置
     */
    __weak typeof(self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate =  weakSelf;
    }
    

}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    if ([self.topViewController isEqual:self.rootViewController]) {
//        return NO;
//    }
    /**
     *  或
     */
    if (self.viewControllers.count == 1) {
        
        return NO;
    }
    return YES;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    self.interactivePopGestureRecognizer.delegate = (id)viewController;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 16)];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        
    }
    [super pushViewController:viewController animated:animated];
}


-(void)popView
{
    [self popViewControllerAnimated:YES];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}
@end
