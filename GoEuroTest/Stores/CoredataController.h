//
//  CoredataController.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import <CoreData/CoreData.h>

typedef NS_ENUM(NSInteger, SortByType) {
	SortByDuration,
	SortByPrice,
	SortByArrival,
};

@interface CoredataController : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext			*managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel			*managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator	*persistentStoreCoordinator;

+ (instancetype)shared;

- (void)saveContext;
- (void)saveContext:(NSError **)error;

// Fetch
- (NSFetchRequest *)fetchResultsWithType:(TypeTrip)TypeTrip sortBy:(SortByType)sortBy;

// create entities
- (void)createOrUpdateEntityWithTypeTrip:(TypeTrip)TypeTrip model:(ResponseModel *)model completion:(void (^)(NSManagedObjectID *objectId))completion;

// sort by method
- (NSString *)sortByNameWithSortBy:(SortByType)TypeTrip;

@end
