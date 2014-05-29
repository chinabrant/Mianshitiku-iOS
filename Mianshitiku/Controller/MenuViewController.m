//
//  MenuViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "MenuViewController.h"
#import "IIViewDeckController.h"
#import "MainViewController.h"
#import "AboutViewController.h"
#import "FeedbackViewController.h"
#import "PostViewController.h"

@interface MenuViewController ()
{
    
}

@end

@implementation MenuViewController

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
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

# pragma mark -
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        UILabel *separatorLine = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.frame.size.height - 0.5, cell.frame.size.width, 0.5)];
        separatorLine.backgroundColor = [UIColor grayColor];
        [cell addSubview:separatorLine];
    }
    
//    cell.textLabel.text = [[categories objectAtIndex:indexPath.row] valueForKey:@"title"];
    switch (indexPath.row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"home"];
            cell.textLabel.text = @"主页";
            break;
            
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"post"];
            cell.textLabel.text = @"出题";
            break;
            
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"feedback"];
            cell.textLabel.text = @"建议";
            
            break;
            
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"about"];
            cell.textLabel.text = @"关于";
            break;
            
        default:
            break;
    }
    
    return cell;
}

# pragma mark -
# pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            if (self.mainVC == nil) {
                self.mainVC = [[MainViewController alloc] init];
            }
            
            self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.mainVC];
            break;
        }
            
        case 1: {
            PostViewController *post = [[PostViewController alloc] init];
            self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:post];
            break;
        }
            
        case 2: {
            FeedbackViewController *feedback = [[FeedbackViewController alloc] init];
            self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:feedback];
            break;
        }
            
        case 3: {
            AboutViewController *about = [[AboutViewController alloc] init];
            self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:about];
            break;
        }
            
        default:
            break;
    }
    
    [self.viewDeckController toggleLeftView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
