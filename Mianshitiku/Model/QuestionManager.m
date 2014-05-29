//
//  QuestionManager.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "QuestionManager.h"
#define Count 14

@implementation QuestionManager

+ (QuestionManager *)shareInstance {
    static QuestionManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

+ (void)requestQuestionsWithBlock:(AVArrayResultBlock)block category:(AVObject *)category page:(int)page {
    AVQuery *query = [AVQuery queryWithClassName:QuestionClassName];
    [query whereKey:@"category" equalTo:category];
    [query whereKey:@"needVerify" notEqualTo:@YES]; // [NSNumber numberWithInt:1]];
    query.limit = Count;
    query.skip = page * Count;
    [query findObjectsInBackgroundWithBlock:block];
}

@end
