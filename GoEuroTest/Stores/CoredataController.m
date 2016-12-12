//
//  Coredata.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "Train+CoreDataClass.h"
#import "Bus+CoreDataClass.h"
#import "Flight+CoreDataClass.h"

static NSString* const DefaultImageSize = @"63";

@implementation CoredataController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)shared {
	static CoredataController *_sharedname = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedname = [[self alloc] init];
	});
	
	return _sharedname;
}

- (void)saveContext {
	[self saveContext:nil];
}

- (void)saveContext:(NSError **)error {
	NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
	if (managedObjectContext != nil) {
		if ([managedObjectContext hasChanges] && ![managedObjectContext save:error]) {
			NSLog(@"Unresolved error %@, %@", *error, [*error userInfo]);
		}
	}
}

#pragma mark - Fetch

- (NSFetchRequest *)fetchResultsWithType:(TypeTrip)TypeTrip sortBy:(SortByType)sortBy {
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	
	NSString *sortByName	= [self sortByNameWithSortBy:SortByDuration];
	NSString *className		= [self entityNameWithTypeTrip:TypeTrip];
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:className inManagedObjectContext:[self managedObjectContext]];
	[fetchRequest setEntity:entity];
	
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortByName ascending:YES];
	[fetchRequest setSortDescriptors:@[sortDescriptor]];
	
	return fetchRequest;
}

#pragma mark - Create or Update Objects

- (void)createOrUpdateEntityWithTypeTrip:(TypeTrip)TypeTrip model:(ResponseModel *)model completion:(void (^)(NSManagedObjectID *objectId))completion {
	
	NSString *className = [self entityNameWithTypeTrip:TypeTrip];
	
	GenericTrip *GenericTrip = [self getGenericTripWithTripId:model.objectId className:className];
	
	if (!GenericTrip) {
		 GenericTrip = [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:_managedObjectContext];
	}
	
	GenericTrip.tripId				= model.objectId.integerValue;
	GenericTrip.departureTime		= model.departureTime;
	GenericTrip.arrivalTime			= model.arrivalTime;
	GenericTrip.stops				= model.numberOfStops.integerValue;
	GenericTrip.priceInEuros		= model.priceInEuros.floatValue;
	GenericTrip.durationInMinutes	= model.durationInMinutes.integerValue;
	GenericTrip.logoUrl				= [model.providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:DefaultImageSize];
		
	if (completion) {
		completion(GenericTrip.objectID);
	}
}

- (GenericTrip *)getGenericTripWithTripId:(NSNumber *)tripId className:(NSString *)className {
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:className];
	[request setPredicate:[NSPredicate predicateWithFormat:@"tripId = %@", tripId]];
	[request setFetchLimit:1];
	NSArray *results = [_managedObjectContext executeFetchRequest:request error:nil];
	return [results firstObject];
}


#pragma mark - Helpers


- (NSString *)entityNameWithTypeTrip:(TypeTrip)TypeTrip {
	switch (TypeTrip) {
		case TypeTrip_Buses:
			return NSStringFromClass([Bus class]);
			break;
		case TypeTrip_Trains:
			return NSStringFromClass([Train class]);
			break;
		case TypeTrip_Flights:
			return NSStringFromClass([Flight class]);
			break;
	}
}

- (NSString *)sortByNameWithSortBy:(SortByType)TypeTrip {
	switch (TypeTrip) {
		case SortByPrice:
			return @"priceInEuros";
			break;
		case SortByDuration:
			return @"durationInMinutes";
			break;
		case SortByArrival:
			return @"arrivalTime";
			break;
	}
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext {
	if (_managedObjectContext != nil) {
		return _managedObjectContext;
	}
	
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	if (coordinator != nil) {
		_managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
		[_managedObjectContext setPersistentStoreCoordinator:coordinator];
	}
	return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel {
	if (_managedObjectModel != nil) {
		return _managedObjectModel;
	}
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"GoEuroTest" withExtension:@"momd"];
	_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	if (_persistentStoreCoordinator != nil) {
		return _persistentStoreCoordinator;
	}
	
	NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"GoEuroTest.sqlite"];
	
	NSError *error = nil;
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:@{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES} error:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	
	return _persistentStoreCoordinator;
}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
