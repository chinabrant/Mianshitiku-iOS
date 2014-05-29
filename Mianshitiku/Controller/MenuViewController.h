//
//  MenuViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MainViewController *mainVC;

@end
