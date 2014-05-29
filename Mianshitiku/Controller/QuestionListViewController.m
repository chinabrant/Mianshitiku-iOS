//
//  QuestionListViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "QuestionListViewController.h"
#import "QuestionManager.h"
#import "QuestionDetailViewController.h"

@interface QuestionListViewController () {
    NSMutableArray *questions;
    int page;
    BOOL haveMore;
}

@end

@implementation QuestionListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        page = 0;
        haveMore = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [self.category valueForKey:@"title"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self requestQuestions];
}

- (void)requestQuestions {
    [self showHudLoadingMessage:@"读取中..."];
    [QuestionManager requestQuestionsWithBlock:^(NSArray *objects, NSError *error) {
        [self hideHud];
        if (error) {
            
        } else {
            if (questions == nil) {
                questions = [[NSMutableArray alloc] initWithArray:objects];
            } else {
                [questions addObjectsFromArray:objects];
            }
            
            if (objects.count < 10) {
                haveMore = NO;
            }
            
            [self.tableView reloadData];
            page ++;
        }
    } category:self.category page:page];
}

# pragma mark -
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (haveMore) {
        return questions.count + 1;
    } else {
        return questions.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"cell";
    QuestionListCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QuestionListCell" owner:self options:nil] lastObject];
    }
    
    if (indexPath.row == questions.count) {
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = @"点击加载更多...";
    } else {
        [cell bindData:[questions objectAtIndex:indexPath.row]];
//        cell.textLabel.textAlignment = NSTextAlignmentLeft;
//        cell.textLabel.text = [[questions objectAtIndex:indexPath.row] valueForKey:@"title"];
    }
    
    return cell;
}

# pragma mark -
# pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == questions.count) {
        [self requestQuestions];
    } else {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        QuestionDetailViewController *qdVC = [[QuestionDetailViewController alloc] init];
        qdVC.question = [questions objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:qdVC animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (questions.count == indexPath.row) {
        return 40;
    }
    return [QuestionListCell cellHeightWithData:[questions objectAtIndex:indexPath.row]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
