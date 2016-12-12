//
//  Flight+CoreDataProperties.m
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "Flight+CoreDataProperties.h"

@implementation Flight (CoreDataProperties)

+ (NSFetchRequest<Flight *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Flight"];
}


@end
