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
    [super pushViewController:viewController animated:animated];
}
/**
 *  注意，这是错误，如果重写在重写 pop方法中self.interactivePopGestureRecognizer.enabled = no;那么页面将卡主
 *
 * 博客也不能全信
 */
//-(NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }
//    
//    return [super popToViewController:viewController animated:animated];
//}
//-(UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
//        self.interactivePopGestureRecognizer.enabled = no;
//    }
//    return [super popViewControllerAnimated:animated];
//}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}
@end
