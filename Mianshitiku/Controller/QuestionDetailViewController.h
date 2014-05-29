//
//  QuestionDetailViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"

@interface QuestionDetailViewController : BaseViewController

@property (strong, nonatomic) AVObject *question;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *answerTextView;
@property (weak, nonatomic) IBOutlet UILabel *sepratorLine;

@end
