//
//  BaseViewController.m
//  Mianshitiku
//
//  Created by wusj on 14-5-14.
//  Copyright (c) 2014年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "IIViewDeckController.h"

@interface BaseViewController () {
    MBProgressHUD *hud;
}

@end

@implementation BaseViewController

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
	// Do any additional setup after loading the view.
    
    
}



- (void)showHudLoadingMessage:(NSString *)message
{
    if (hud) {
        [self hideHud];
    }
    
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = message;
    [hud show:YES];
}

- (void)showHudMessage:(NSString *)message
{
    if (hud) {
        [self hideHud];
    }
    
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}

- (void)hideHud
{
    if (hud) {
        [hud removeFromSuperview];
        hud = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
