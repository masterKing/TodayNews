//
//  TNNetworkTool.m
//  TodayNews
//
//  Created by Franky on 2018/6/12.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNNetworkTool.h"


@implementation TNNetworkTool

+ (void)loadHomeNewsTitleData:(void (^)(NSArray *))completionHandler{
    NSString *url = [NSString stringWithFormat:@"%@/article/category/get_subscribed/v1/?",BASE_URL];
    
}

@end
