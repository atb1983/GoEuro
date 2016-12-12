//
//  UIAlertController+Extentions.m
//  AlexFranco
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "UIAlertController+Extentions.h"

@implementation UIAlertController (Extentions)

+ (void)showWithError:(NSError*) error inViewController:(UIViewController *)inViewController completion:(void (^)(UIAlertAction *action))completion {
	[self showAlert:[error localizedDescription] message:[error localizedRecoverySuggestion] inViewController:inViewController completion:completion];
}

+ (void)showWithMessage:(NSString *)message inViewController:(UIViewController *)inViewController completion:(void (^)(UIAlertAction *action))completion {
	[self showAlert:@"GoEuro" message:message inViewController:inViewController completion:completion];
}

+ (void)showWithTitle:(NSString *)title message:(NSString *)message inViewController:(UIViewController *)inViewController  completion:(void (^)(UIAlertAction *action))completion {
	[self showAlert:title message:message inViewController:inViewController completion:completion];
}

+ (void)showAlert:(NSString *)title message:(NSString *)message inViewController:(UIViewController *)inViewController completion:(void (^)(UIAlertAction *action))completion {
	// preventing showing multiple alerts
	if ([inViewController.navigationController.visibleViewController isKindOfClass:[UIAlertController class]]) {
		return;
	}
	
	UIAlertController * alert = [UIAlertController
								 alertControllerWithTitle:title
								 message:message
								 preferredStyle:UIAlertControllerStyleAlert];
	
	//Add dismiss button
	
	UIAlertAction* dismissButton = [UIAlertAction
									actionWithTitle:@"Dismiss"
									style:UIAlertActionStyleDefault
									handler:completion];
	
	[alert addAction:dismissButton];
	
	[inViewController presentViewController:alert animated:YES completion:nil];
}

@end
