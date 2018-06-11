//
//  TNMyNavigationController.m
//  TodayNews
//
//  Created by Franky on 2018/6/11.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNMyNavigationController.h"

@interface TNMyNavigationController ()

@end

@implementation TNMyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_background"] forBarMetrics:(UIBarMetricsDefault)];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"lefterbackicon_titlebar_24x24_"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBack)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationBack{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
