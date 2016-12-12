//
//  BaseViewModel.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "GenericTrip+CoreDataClass.h"
#import "ImageCacheController.h"

@class BaseViewModel;

// Delegate
@protocol BaseViewModelDelegate <NSObject>
- (void)didContentChanged:(BaseViewModel *)mainViewModel;
@end

@interface BaseViewModel : NSObject

@property (nonatomic, weak) id<BaseViewModelDelegate> delegate;
@property (nonatomic, strong, readonly) NSArray<GenericTrip *> *results;

- (instancetype)initWithDelegate:(id<BaseViewModelDelegate>)delegate TypeTrip:(TypeTrip)TypeTrip;

// Public methods

// Fetch from Go Euro Api end point, use it will trigger didContentChanged if there are changes.
- (void)updateModelFromInternetWithCompletion:(void (^)(NSError *error))completion;

// Call this method if you want to change the sort by condition. it will perform a fetch to coredata
- (void)sortBy:(SortByType)sortBy;

@end
