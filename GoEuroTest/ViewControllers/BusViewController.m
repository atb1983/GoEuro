//
//  BusViewController.m
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "BusViewController.h"

@interface BusViewController () <BaseViewModelDelegate>

@end

@implementation BusViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.model = [[BaseViewModel alloc] initWithDelegate:self TypeTrip:TypeTrip_Buses];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.tabBar setSelectedItem:self.busTabBarItem];
}

#pragma mark - BaseViewModelDelegate

- (void)didContentChanged:(BaseViewModel *)mainViewModel {
	[self.tableView reloadData];
}

@end
