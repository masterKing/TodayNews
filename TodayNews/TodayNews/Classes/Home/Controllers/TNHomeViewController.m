//
//  TNHomeViewController.m
//  TodayNews
//
//  Created by Franky on 2018/6/11.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNHomeViewController.h"
#import "SGPagingView.h"

@interface TNHomeViewController ()
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;

/**
 添加频道按钮
 */
@property (nonatomic, strong) UIButton *addChannelButton;
@end

@implementation TNHomeViewController

#pragma mark - load lazy
- (UIButton *)addChannelButton{
    if (_addChannelButton == nil) {
        _addChannelButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - newsTitleHeight, 0, newsTitleHeight, newsTitleHeight)];
        [_addChannelButton theme_setImage:[ThemeImagePicker pickerWithKeyPath:@"images.add_channel_titlbar_thin_new_16x16_"] forState:UIControlStateNormal];
        
        UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, newsTitleHeight - 1, newsTitleHeight, 1)];
        separatorView.theme_backgroundColor = [ThemeColorPicker pickerWithKeyPath:@"colors.separatorViewColor"];
        [_addChannelButton addSubview:separatorView];
    }
    return _addChannelButton;
}

#pragma mark -
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIApplication.sharedApplication.keyWindow.theme_backgroundColor = [ThemeColorPicker pickerWithKeyPath:@"colors.windowColor"];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController setNavigationBarHidden:false animated:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"navigation_background%@",[NSUserDefaults.standardUserDefaults boolForKey:isNight] ? @"_night" : @""]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置UI
    [self setupUI];
    // 点击事件
    [self clickAction];
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

- (void)setupUI{
    self.view.theme_backgroundColor = [ThemeColorPicker pickerWithKeyPath:@"colors.cellBackgroundColor"];
    //self.navigationItem.titleView =
    [self.view addSubview:self.addChannelButton];
    
}

- (void)clickAction{
    
}

@end
