//
//  Bus+CoreDataProperties.m
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "Bus+CoreDataProperties.h"

@implementation Bus (CoreDataProperties)

+ (NSFetchRequest<Bus *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Bus"];
}


@end
