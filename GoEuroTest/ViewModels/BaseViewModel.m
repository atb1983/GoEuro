//
//  BaseViewModel.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "BaseViewModel.h"
#import "ImageCacheController.h"

@interface BaseViewModel () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchController;
@property (nonatomic, assign) SortByType sortBy;
@property (nonatomic, assign) TypeTrip TypeTrip;

@end

@implementation BaseViewModel

- (instancetype)init {
	self = [super init];
	if (self) {
		[self commonInit];
	}
	
	return self;
}

- (instancetype)initWithDelegate:(id<BaseViewModelDelegate>)delegate TypeTrip:(TypeTrip)TypeTrip {
	self = [super init];
	if (self) {
		self.TypeTrip = TypeTrip;
		self.delegate = delegate;
		[self commonInit];
	}
	
	return self;
}

- (void)commonInit {
	_sortBy = SortByDuration; // default sort is duration
	
	NSManagedObjectContext *context = [[CoredataController shared] managedObjectContext];
	
	// if the context is nil it wont' create the fetchController
	if (context) {
		NSFetchRequest *fetchRequet = [[CoredataController shared] fetchResultsWithType:self.TypeTrip sortBy:self.sortBy];
		self.fetchController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequet managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
		self.fetchController.delegate = self;
		[self.fetchController performFetch:nil];
		_results = [self.fetchController fetchedObjects];
	} else {
		NSLog(@"%s the context is nil", __PRETTY_FUNCTION__);
	}
}

#pragma mark - Public Methods 

- (void)updateModelFromInternetWithCompletion:(void (^)(NSError *error))completion {
	[GoEuroAPI getResultWithType:self.TypeTrip completion:^(ResponseListModel *model, NSError *error) {
		if (error) {
			completion(error);
		} else {
			
			for (ResponseModel *responseModel in model.responseObjects) {
				[[CoredataController shared] createOrUpdateEntityWithTypeTrip:self.TypeTrip model:responseModel completion:nil];
			}
			
			[[CoredataController shared] saveContext:&error];
			completion(error);
		}
	}];
}

- (void)sortBy:(SortByType)sortBy {
	self.sortBy = sortBy;
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:[[CoredataController shared] sortByNameWithSortBy:sortBy] ascending:YES];
	[[self.fetchController fetchRequest] setSortDescriptors:@[sortDescriptor]];
	[self.fetchController performFetch:nil];
	_results = [self.fetchController fetchedObjects];
	
	if ([self.delegate respondsToSelector:@selector(didContentChanged:)]) {
		[self.delegate didContentChanged:self];
	}
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	_results = [self.fetchController fetchedObjects];
	
	if ([self.delegate respondsToSelector:@selector(didContentChanged:)]) {
		[self.delegate didContentChanged:self];
	}
}

@end
