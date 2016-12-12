//
//  UIAlertController+Extentions.h
//  AlexFranco
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

@interface UIAlertController (Extentions)

// these methods show a unique UIAlerViewController from a given error
+ (void)showWithError:(NSError*) error inViewController:(UIViewController *)inViewController completion:(void (^)(UIAlertAction *action))completion;

+ (void)showWithMessage:(NSString *)message inViewController:(UIViewController *)inViewController completion:(void (^)(UIAlertAction *action))completion;

+ (void)showWithTitle:(NSString *)title message:(NSString *)message inViewController:(UIViewController *)inViewController  completion:(void (^)(UIAlertAction *action))completion;

@end
