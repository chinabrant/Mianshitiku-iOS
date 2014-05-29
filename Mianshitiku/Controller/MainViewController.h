//
//  MainViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MainViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
