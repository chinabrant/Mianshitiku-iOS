//
//  QuestionListCell.h
//  Mianshitiku
//
//  Created by wusj on 14-5-16.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 计算cell的高度
+ (float)cellHeightWithData:(AVObject *)data;
// 给cell绑定数据
- (void)bindData:(AVObject *)data;

@end
