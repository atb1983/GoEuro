//
//  UIViewController+Extentions.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "UIViewController+Extentions.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIViewController (Extentions)

- (void)showSpinner {
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	hud.mode = MBProgressHUDModeIndeterminate;
	hud.label.text = @"Refreshing...";
}

- (void)hideSpinner {
	[MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
