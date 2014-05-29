//
//  QuestionDetailViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "UIView+Positioning.h"

@interface QuestionDetailViewController ()

@end

@implementation QuestionDetailViewController

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
    
    float textHei = [PublicFunction getTextContentHeight:[self.question valueForKey:@"title"] font:[UIFont systemFontOfSize:17] limitWidth:300];
//    NSLog(@"height : %f", textHei);
    self.titleLabel.height = textHei;
//    self.titleLabel.backgroundColor = [UIColor orangeColor];
    self.sepratorLine.y = self.titleLabel.y + self.titleLabel.height + 5;
    self.sepratorLine.height = 0.5;
    self.answerTextView.y = self.sepratorLine.y + 6;
    
    
    self.title = [self.question valueForKey:@"title"];
    self.titleLabel.text = [self.question valueForKey:@"title"];
    self.answerTextView.text = [self.question valueForKey:@"answer"];
    

//    
    [self openUpdate];
}

- (void)update
{
    [self.question setObject:self.answerTextView.text forKey:@"answer"];
    [self.question saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [self showHudMessage:@"更新成功"];
        } else {
            [self showHudMessage:@"更新失败"];
        }
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)openUpdate
{
    self.answerTextView.editable = YES;
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"send"] style:UIBarButtonItemStyleDone target:self action:@selector(update)];
    self.navigationItem.rightBarButtonItem = sendItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
