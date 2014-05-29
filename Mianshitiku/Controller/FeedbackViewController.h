//
//  FeedbackViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-15.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"

@interface FeedbackViewController : BaseViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)okButtonClicked:(id)sender;

@end
