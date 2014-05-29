//
//  SelectCategoryViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"

@protocol SelectCategoryViewControllerDelegate <NSObject>

- (void)didSelectCategory:(AVObject *)cate;

@end

@interface SelectCategoryViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) id <SelectCategoryViewControllerDelegate> delegate;

@end
