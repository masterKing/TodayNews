//
//  TNNewsTitleModel.h
//  TodayNews
//
//  Created by Franky on 2018/6/12.
//  Copyright © 2018年 Franky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TNNewsTitleModel : NSObject
@property (nonatomic, copy) NSString *category;
@property (nonatomic, assign) NSInteger tip_new;
@property (nonatomic, assign) NSInteger default_add;
@property (nonatomic, copy) NSString *web_url;
@property (nonatomic, copy) NSString *concern_id;
@property (nonatomic, copy) NSString *icon_url;
@property (nonatomic, assign) NSInteger flags;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *name;
@end

