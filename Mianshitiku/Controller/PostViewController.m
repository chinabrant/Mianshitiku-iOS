//
//  PostViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "PostViewController.h"
#import "IIViewDeckController.h"


@interface PostViewController () {
    AVObject *category;
}

@end

@implementation PostViewController

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
    self.title = @"出题";
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(openMenu)];
    self.navigationItem.leftBarButtonItem = menuItem;
    
    UIBarButtonItem *sendItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"send"] style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem = sendItem;
    
    self.answerTextView.layer.cornerRadius = 8.0f;
    self.answerTextView.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    self.answerTextView.layer.borderWidth = 0.5;
    
    self.answerTextView.delegate = self;
    self.titleField.delegate = self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

# pragma mark -
# pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}

- (void)openMenu
{
    [self.viewDeckController toggleLeftView];
}

- (void)send
{
    if (category == nil) {
        [self showHudMessage:@"分类不能为空"];
        return ;
    }
    
    if (self.titleField.text == nil || [self.titleField.text isEqualToString:@""]) {
        [self showHudMessage:@"标题不能为空"];
        return;
    }
    
    if (self.answerTextView.text == nil || [self.answerTextView.text isEqualToString:@""]) {
        [self showHudMessage:@"答案不能为空"];
        return;
    }
    
    [self showHudLoadingMessage:@"出题中..."];
    AVObject *obj = [[AVObject alloc] initWithClassName:QuestionClassName];
    [obj setObject:category forKey:@"category"];
    [obj setObject:self.titleField.text forKey:@"title"];
    [obj setObject:self.answerTextView.text forKey:@"answer"];
    [obj setObject:@YES forKey:@"needVerify"]; // 是否要审核 [NSNumber numberWithInt:1]
    [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self hideHud];
        if (succeeded) {
            NSLog(@"保存成功");
            [self showHudMessage:@"出题成功,审核通过后会显示在对应分类下,感谢您的贡献!"];
        } else {
            NSLog(@"保存失败");
            [self showHudMessage:@"出题失败,请检查网络连接,稍候再试!"];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)categoryButtonClicked:(id)sender {
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"iOS开发", nil];
//    [actionSheet showInView:self.view];
    SelectCategoryViewController *sc = [[SelectCategoryViewController alloc] init];
    sc.delegate = self;
    [self.navigationController pushViewController:sc animated:YES];
}

- (void)didSelectCategory:(AVObject *)cate
{
    category = cate;
    [self.categoryButton setTitle:[category valueForKey:@"title"] forState:UIControlStateNormal];
}

# pragma mark -
# pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end
