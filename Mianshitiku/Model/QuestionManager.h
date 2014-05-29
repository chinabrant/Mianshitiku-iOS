//
//  QuestionManager.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionManager : NSObject

+ (QuestionManager *)shareInstance;
+ (void)requestQuestionsWithBlock:(AVArrayResultBlock)block category:(AVObject *)category page:(int)page;

@end
