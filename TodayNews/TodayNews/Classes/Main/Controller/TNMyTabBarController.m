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
    //UITabBar.appearance.tintColor = [UIColor colorWithRed:248.0 / 255 green:89.0 / 255 blue:88.0 / 255 alpha:1.0];
    UITabBar *tabBar = UITabBar.appearance;
    tabBar.theme_tintColor = [ThemeColorPicker pickerWithKeyPath:@"colors.tabbarTintColor"];
    tabBar.theme_barTintColor = [ThemeColorPicker pickerWithKeyPath:@"colors.cellBackgroundColor"];
    
    [self addChildViewControllers];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(receiveDayOrNightButtonClicked:) name:dayOrNightButtonClicked object:nil];
}

- (void)receiveDayOrNightButtonClicked:(NSNotification *)notification{
    BOOL selected = [notification.object boolValue];
    if (selected) {
        // 夜间模式
        for (UIViewController *childController in self.childViewControllers) {
            if ([childController.title isEqualToString:@"首页"]) {
                [self setNightChildController:childController imageName:@"home"];
            }
            if ([childController.title isEqualToString:@"西瓜视频"]) {
                [self setNightChildController:childController imageName:@"video"];
            }
            if ([childController.title isEqualToString:@"小视频"]) {
                [self setNightChildController:childController imageName:@"huoshan"];
            }
            if ([childController.title isEqualToString:@"微头条"]) {
                [self setNightChildController:childController imageName:@"weitoutiao"];
            }
            if ([childController.title isEqualToString:@""]) {
                [self setNightChildController:childController imageName:@"redpackage"];
            }
        }
    }else{
        // 日间模式
        for (UIViewController *childController in self.childViewControllers) {
            if ([childController.title isEqualToString:@"首页"]) {
                [self setDayChildController:childController imageName:@"home"];
            }
            if ([childController.title isEqualToString:@"西瓜视频"]) {
                [self setDayChildController:childController imageName:@"video"];
            }
            if ([childController.title isEqualToString:@"小视频"]) {
                [self setDayChildController:childController imageName:@"huoshan"];
            }
            if ([childController.title isEqualToString:@"微头条"]) {
                [self setDayChildController:childController imageName:@"weitoutiao"];
            }
            if ([childController.title isEqualToString:@""]) {
                [self setDayChildController:childController imageName:@"redpackage"];
            }
        }
    }
}


/**
 设置夜间模式
 */
- (void)setNightChildController:(UIViewController *)viewController imageName:(NSString *)imageName{
    NSString *one = [NSString stringWithFormat:@"%@_tabbar_night_32x32_",imageName];
    viewController.tabBarItem.image = [UIImage imageNamed:one];
    
    NSString *two = [NSString stringWithFormat:@"%@_tabbar_press_night_32x32_",imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:two];
}

/**
 设置日间模式
 */
- (void)setDayChildController:(UIViewController *)viewController imageName:(NSString *)imageName{
    NSString *one = [NSString stringWithFormat:@"%@_tabbar_32x32_",imageName];
    viewController.tabBarItem.image = [UIImage imageNamed:one];
    
    NSString *two = [NSString stringWithFormat:@"%@_tabbar_press_32x32_",imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:two];
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
    if ([NSUserDefaults.standardUserDefaults boolForKey:isNight]) {
        [self setNightChildController:childViewController imageName:imageName];
    }else{
        [self setDayChildController:childViewController imageName:imageName];
    }
    [self addChildViewController:[[TNMyNavigationController alloc] initWithRootViewController:childViewController]];
}

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

@end
