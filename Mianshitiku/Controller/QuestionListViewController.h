//
//  QuestionListViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "QuestionListCell.h"

@interface QuestionListViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) AVObject *category;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
