//
//  Train+CoreDataProperties.m
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "Train+CoreDataProperties.h"

@implementation Train (CoreDataProperties)

+ (NSFetchRequest<Train *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Train"];
}


@end
