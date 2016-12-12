//
//  TrainViewController.m
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "TrainViewController.h"

@interface TrainViewController () <BaseViewModelDelegate>

@end

@implementation TrainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.model = [[BaseViewModel alloc] initWithDelegate:self TypeTrip:TypeTrip_Trains];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.tabBar setSelectedItem:self.trainTabBarItem];
}

#pragma mark - BaseViewModelDelegate

- (void)didContentChanged:(BaseViewModel *)mainViewModel {
	[self.tableView reloadData];
}

@end
