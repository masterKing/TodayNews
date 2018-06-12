//
//  TNNetworkTool.h
//  TodayNews
//
//  Created by Franky on 2018/6/12.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TNNetworkTool : NSObject

+ (void)loadHomeNewsTitleData:(void (^)(NSArray *newsTitles))completionHandler;

@end
