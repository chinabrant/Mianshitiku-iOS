//
//  StCategoryManager.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "StCategoryManager.h"

@implementation StCategoryManager

+ (StCategoryManager *)shareInstance {
    static StCategoryManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

+ (void)requestStCategoryWithBlock:(AVArrayResultBlock)block {
    AVQuery *query = [AVQuery queryWithClassName:StCategoryClassName];
    [query findObjectsInBackgroundWithBlock:block];
}

@end
