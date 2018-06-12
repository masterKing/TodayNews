//
//  TNHomeViewController.m
//  TodayNews
//
//  Created by Franky on 2018/6/11.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNHomeViewController.h"
#import "SGPagingView.h"
#import "TNNewsTitleModel.h"
#import "TNHomeRecommendController.h"

@interface TNHomeViewController () <SGPageTitleViewDelegate,SGPageContentViewDelegate>
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
    
    [TNNetworkTool loadHomeNewsTitleData:^(NSArray *newsTitles) {
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:8];
        NSMutableArray *nameArr = [NSMutableArray arrayWithCapacity:8];
        for (NSDictionary *dic in newsTitles) {
            TNNewsTitleModel *titleModel = [TNNewsTitleModel yy_modelWithDictionary:dic];
            [mArr addObject:titleModel];
            [nameArr addObject:titleModel.name];
        }
        
        
        SGPageTitleViewConfigure *config = [[SGPageTitleViewConfigure alloc] init];
        config.titleColor = [UIColor jw_colorWithHex:0x333333];
        config.titleSelectedColor = [UIColor redColor];
        config.indicatorColor = [UIColor clearColor];
        
        self.pageTitleView = [[SGPageTitleView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - newsTitleHeight, newsTitleHeight) delegate:self titleNames:nameArr configure:config];
        self.pageTitleView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.pageTitleView];
        
        [mArr enumerateObjectsUsingBlock:^(TNNewsTitleModel *titleModel, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([titleModel.category isEqualToString:@"video"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor redColor];
                [self addChildViewController:vc];
            }else if ([titleModel.category isEqualToString:@"essay_joke"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor greenColor];
                [self addChildViewController:vc];
            }else if ([titleModel.category isEqualToString:@"image_ppmm"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor blueColor];
                [self addChildViewController:vc];
            }else if ([titleModel.category isEqualToString:@"image_funny"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor yellowColor];
                [self addChildViewController:vc];
            }else if ([titleModel.category isEqualToString:@"组图"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor brownColor];
                [self addChildViewController:vc];
            }else if ([titleModel.category isEqualToString:@"jinritemai"]) {
                UIViewController *vc = [UIViewController new];
                vc.view.backgroundColor = [UIColor purpleColor];
                [self addChildViewController:vc];
            }else{
                TNHomeRecommendController *recommendVC = [[TNHomeRecommendController alloc] init];
                recommendVC.view.backgroundColor = [UIColor cyanColor];
                [self addChildViewController:recommendVC];
            }
        }];
        
        self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, newsTitleHeight, kScreenWidth, self.view.bounds.size.height - newsTitleHeight) parentVC:self childVCs:self.childViewControllers];
        self.pageContentView.delegatePageContentView = self;
        [self.view addSubview:self.pageContentView];
    }];
}

- (void)clickAction{
    
}

#pragma mark - SGPageTitleViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex{
    NSLog(@"当前选中的下标为---------%zd",selectedIndex);
}

#pragma mark - SGPageContentViewDelegate
- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
