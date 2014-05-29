//
//  BaseViewController.h
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)showHudLoadingMessage:(NSString *)message;
- (void)hideHud;
- (void)showHudMessage:(NSString *)message;

@end
