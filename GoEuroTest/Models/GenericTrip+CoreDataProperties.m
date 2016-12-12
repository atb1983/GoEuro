//
//  GenericTrip+CoreDataProperties.m
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "GenericTrip+CoreDataProperties.h"

@implementation GenericTrip (CoreDataProperties)

+ (NSFetchRequest<GenericTrip *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GenericTrip"];
}

@dynamic arrivalTime;
@dynamic departureTime;
@dynamic durationInMinutes;
@dynamic logoUrl;
@dynamic priceInEuros;
@dynamic tripId;
@dynamic stops;

@end
