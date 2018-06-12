//
//  TNNetworkTool.m
//  TodayNews
//
//  Created by Franky on 2018/6/12.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import "TNNetworkTool.h"
#import <AFNetworking/AFNetworking.h>

@implementation TNNetworkTool

+ (void)loadHomeNewsTitleData:(void (^)(NSArray *))completionHandler{
    NSString *url = [NSString stringWithFormat:@"%@/article/category/get_subscribed/v1/?",BASE_URL];
    
    NSDictionary *para = @{@"device_id": @(device_id),
                           @"iid": @(iid),};
    
    [[AFHTTPSessionManager manager] GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject[@"data"][@"data"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
