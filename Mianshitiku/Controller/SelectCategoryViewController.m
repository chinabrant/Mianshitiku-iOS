//
//  SelectCategoryViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "SelectCategoryViewController.h"
#import "StCategoryManager.h"

@interface SelectCategoryViewController () {
    NSArray *categories;
}

@end

@implementation SelectCategoryViewController

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
    self.title = @"选择分类";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self queryStCategory];
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectCategory:)]) {
        [self.delegate didSelectCategory:[categories objectAtIndex:indexPath.row]];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
