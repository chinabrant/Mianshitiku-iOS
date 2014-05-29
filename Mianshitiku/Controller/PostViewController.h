//
//  PostViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "SelectCategoryViewController.h"

@interface PostViewController : BaseViewController <UIActionSheetDelegate, SelectCategoryViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *categoryButton;
@property (weak, nonatomic) IBOutlet UITextField *answerField;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;
@property (weak, nonatomic) IBOutlet UITextField *titleField;

- (IBAction)categoryButtonClicked:(id)sender;

@end
