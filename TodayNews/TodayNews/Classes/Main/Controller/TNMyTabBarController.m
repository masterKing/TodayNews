//
//  TNMyTabBarController.m
//  TodayNews
//
//  Created by Franky on 2018/6/11.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNMyTabBarController.h"
#import <SwiftTheme/SwiftTheme-Swift.h>
#import "TNMyNavigationController.h"
#import "TNHomeViewController.h"
#import "TNHuoshanViewController.h"
#import "TNRedPackageViewController.h"
#import "TNVideoViewController.h"
#import "TNWeitoutiaoViewController.h"

@implementation TNMyTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    UITabBar.appearance.tintColor = [UIColor colorWithRed:248.0 / 255 green:89.0 / 255 blue:88.0 / 255 alpha:1.0];
    [self addChildViewControllers];
}

- (void)addChildViewControllers{
    [self setChildViewController:[TNHomeViewController new] title:@"首页" imageName:@"home"];
    [self setChildViewController:[TNVideoViewController new] title:@"西瓜视频" imageName:@"video"];
    [self setChildViewController:[TNRedPackageViewController new] title:@"" imageName:@"redpackage"];
    [self setChildViewController:[TNWeitoutiaoViewController new] title:@"微头条" imageName:@"weitoutiao"];
    [self setChildViewController:[TNHuoshanViewController new] title:@"小视频" imageName:@"huoshan"];
}

- (void)setChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName{
    childViewController.tabBarItem.title = title;
    NSString *one = [NSString stringWithFormat:@"%@_tabbar_32x32_",imageName];
    NSString *two = [NSString stringWithFormat:@"%@_tabbar_press_32x32_",imageName];
    childViewController.tabBarItem.image = [UIImage imageNamed:one];
    childViewController.tabBarItem.selectedImage = [UIImage imageNamed:two];
    [self addChildViewController:[[TNMyNavigationController alloc] initWithRootViewController:childViewController]];
}

@end
