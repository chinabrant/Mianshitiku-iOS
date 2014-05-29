//
//  FeedbackViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "FeedbackViewController.h"
#import "IIViewDeckController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

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
    self.title = @"反馈";
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(openMenu)];
    self.navigationItem.leftBarButtonItem = menuItem;
//    self.textView.delegate = self;
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    self.textView.layer.borderWidth = 0.5;
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"send"] style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem = sendItem;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)openMenu
{
    [self.viewDeckController toggleLeftView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.view endEditing:YES];
    [self.textView endEditing:YES];
    [super viewWillDisappear:animated];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)send
{
    if (self.textView.text == nil || [self.textView.text isEqualToString:@""]) {
        [self showHudMessage:@"请先填写意见"];
        return;
    }
    
    AVObject *feedback = [AVObject objectWithClassName:FeedbackClassName];
    [feedback setObject:self.textView.text forKey:@"content"];
    [self showHudLoadingMessage:@"提交中..."];
    [feedback saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self hideHud];
        if (succeeded) {
            NSLog(@"发送成功!");
            [self showHudMessage:@"发送成功，感谢您的反馈!"];
        } else {
            NSLog(@"发送失败");
            [self showHudMessage:@"发送失败，请稍候重试!"];
        }
    }];
}

- (IBAction)okButtonClicked:(id)sender {
    if (self.textView.text == nil || [self.textView.text isEqualToString:@""]) {
        [self showHudMessage:@"请先填写意见"];
        return;
    }
    
    AVObject *feedback = [AVObject objectWithClassName:FeedbackClassName];
    [feedback setObject:self.textView.text forKey:@"content"];
    [self showHudLoadingMessage:@"提交中..."];
    [feedback saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self hideHud];
        if (succeeded) {
            NSLog(@"发送成功!");
            [self showHudMessage:@"发送成功，感谢您的反馈!"];
        } else {
            NSLog(@"发送失败");
            [self showHudMessage:@"发送失败，请稍候重试!"];
        }
    }];
}

@end
