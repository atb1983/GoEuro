//
//  BaseResultViewController.m
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "BaseResultViewController.h"
#import "ResultTableViewCell.h"
#import "UIAlertController+Extentions.h"
#import "GoEuroTest-Swift.h"

static NSString *const ResultTableViewCellID = @"ResultTableViewCellID";

@interface BaseResultViewController () <UITableViewDataSource, UITableViewDelegate, UITabBarDelegate>

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation BaseResultViewController

- (void)viewDidLoad {
	[super viewDidLoad];	
	[self configureView];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	// after we loaded the data from coredata we try to fetch new data from internet
	[self refreshContentFromInternet:YES];
}

- (void)configureView {
	self.refreshControl = [[UIRefreshControl alloc] init];
	[self.refreshControl addTarget:self action:@selector(requestRefreshContentFromInternet) forControlEvents:UIControlEventValueChanged];
	[self.tableView addSubview:self.refreshControl];
	
	[self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ResultTableViewCell class]) bundle:nil] forCellReuseIdentifier:ResultTableViewCellID];
}

#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSInteger numOfSections = 0;
	if (self.model.results.count > 0) {
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
		numOfSections                = 1;
		self.tableView.backgroundView = nil;
		numOfSections = self.model.results.count;
	}
	else {
		// No results
		UILabel *noDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
		noDataLabel.text				= @"No results";
		noDataLabel.textAlignment		= NSTextAlignmentCenter;
		self.tableView.backgroundView	= noDataLabel;
		self.tableView.separatorStyle	= UITableViewCellSeparatorStyleNone;
	}
	
	return numOfSections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ResultTableViewCell *cell = (ResultTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ResultTableViewCellID];
	
	GenericTrip *result = [self.model.results objectAtIndex:indexPath.row];
	[cell setupCellWithGenericTrip:result];
	
	cell.selectionStyle = UITableViewCellSelectionStyleDefault;
	UIView *selectionView = [[UIView alloc] init];
	selectionView.frame = cell.frame;
	[selectionView setBackgroundColor:[Theme themeCellHighlightColour]];
	cell.selectedBackgroundView = selectionView;
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	[UIAlertController showWithMessage:@"Offer details are not yet implemented!" inViewController:self completion:nil];
}

#pragma mark - UITabBarDelegate 

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
	NSUInteger indexOfTab = [[tabBar items] indexOfObject:item];

	if ([self.delegate respondsToSelector:@selector(didTabBarItemSelected:index:)]) {
		[self.delegate didTabBarItemSelected:item index:indexOfTab];
	}	
}

#pragma mark - IBActions

- (IBAction)sortButtonPressed:(id)sender {
	UIAlertController * alert = [UIAlertController
								 alertControllerWithTitle:@"Sort by"
								 message:@"Select one option"
								 preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *durationButton	=	[UIAlertAction
										 actionWithTitle:@"Sort by duration (Default)"
										 style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction * _Nonnull action) {
											 [self sortByDuration];
										 }];
	
	UIAlertAction *priceButton	=	[UIAlertAction
										actionWithTitle:@"Sort by price"
										style:UIAlertActionStyleDefault
										handler:^(UIAlertAction * _Nonnull action) {
											[self sortByPrice];
										}];
	
	UIAlertAction *arrivalButton	=	[UIAlertAction
										actionWithTitle:@"Sort by arrival"
										style:UIAlertActionStyleDefault
										handler:^(UIAlertAction * _Nonnull action) {
											[self sortByArrival];
										}];
	
	//Add dismiss button
	UIAlertAction *dismissButton = [UIAlertAction
									actionWithTitle:@"Dismiss"
									style:UIAlertActionStyleCancel
									handler:nil];
	
	[alert addAction:durationButton];
	[alert addAction:priceButton];
	[alert addAction:arrivalButton];
	[alert addAction:dismissButton];
	
	[self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Methods

- (void)requestRefreshContentFromInternet {
	// we don't need to show the activity indicator in this situation [calling from refresh control view];
	[self refreshContentFromInternet:NO];
}

- (void)refreshContentFromInternet:(BOOL)showSpinner {
	if (showSpinner) {
		[self showSpinner];
	}
	
	[self.model updateModelFromInternetWithCompletion:^(NSError *error) {
		
		if (showSpinner) {
			[self hideSpinner];
		}
		
		[self.refreshControl endRefreshing];
		if (error) {
			[UIAlertController showWithError:error inViewController:self completion:nil];
		}
	}];
}

- (void)sortByDuration {
	[self.model sortBy:SortByDuration];
}

- (void)sortByArrival {
	[self.model sortBy:SortByArrival];
}

- (void)sortByPrice {
	[self.model sortBy:SortByPrice];
}

@end



