//
//  MainViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "MainViewController.h"
#import "IIViewDeckController.h"
#import "StCategoryManager.h"
#import "QuestionListViewController.h"

@interface MainViewController () {
    NSMutableArray *categories;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"分类";
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(openMenu)]; 
    self.navigationItem.leftBarButtonItem = menuItem;
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(queryStCategory)];
    self.navigationItem.rightBarButtonItem = refreshItem;
    
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self queryStCategory];
}

- (void)openMenu {
    [self.viewDeckController toggleLeftView];
}

- (void)queryStCategory {
    [self showHudLoadingMessage:@"分类读取中..."];
    [StCategoryManager requestStCategoryWithBlock:^(NSArray *objects, NSError *error) {
        [self hideHud];
        if (error) {
            NSLog(@"读取分类失败");
        } else {
            categories = [[NSMutableArray alloc] initWithArray:objects];
            [self.tableView reloadData];
        }
    }];
}

# pragma mark -
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }

    cell.textLabel.text = [[categories objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    return cell;
}

# pragma mark -
# pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QuestionListViewController *qlVC = [[QuestionListViewController alloc] init];
    qlVC.category = [categories objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:qlVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
