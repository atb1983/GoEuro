//
//  Bus+CoreDataProperties.h
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "Bus+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Bus (CoreDataProperties)

+ (NSFetchRequest<Bus *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
