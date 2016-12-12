//
//  FlightViewController.m
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "FlightViewController.h"

@interface FlightViewController () <BaseViewModelDelegate>


@end

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.model = [[BaseViewModel alloc] initWithDelegate:self TypeTrip:TypeTrip_Flights];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self.tabBar setSelectedItem:self.flightTabBarItem];
}

#pragma mark - BaseViewModelDelegate

- (void)didContentChanged:(BaseViewModel *)mainViewModel {
	[self.tableView reloadData];
}

@end
