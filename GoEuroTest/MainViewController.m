
//
//  MainViewController.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "MainViewController.h"
#import "UIAlertController+Extentions.h"
#import "BaseResultViewController.h"

@interface MainViewController () <BaseResultViewControllerDelegate, UITabBarControllerDelegate, UIViewControllerAnimatedTransitioning>

@end

@implementation MainViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		self.navigationItem.prompt = @"Berlin - Munich";
		self.navigationItem.title = @"Jun 07";
	}
	
	return self;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.delegate = self;
	
	for (BaseResultViewController *viewController in self.viewControllers) {
		viewController.delegate = self;
	}
}

#pragma mark - BaseResultViewControllerDelegate

- (void)didTabBarItemSelected:(UITabBarItem *)barItemSelected index:(NSUInteger)index {
	self.selectedIndex = index;
}

#pragma mark - UITabBarControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
		   animationControllerForTransitionFromViewController:(UIViewController *)fromVC
											 toViewController:(UIViewController *)toVC {
	return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
	return 0.8f;
}

// simple fading animation
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
	UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	
	toViewController.view.alpha = 0.0f;
	[[transitionContext containerView] addSubview:toViewController.view];
	
	[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
		toViewController.view.alpha = 1.0f;
	} completion:^(BOOL finished){
		[fromViewController.view removeFromSuperview];
		[transitionContext completeTransition:finished];
	}];
}

@end



