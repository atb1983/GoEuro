//
//  Flight+CoreDataProperties.h
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "Flight+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Flight (CoreDataProperties)

+ (NSFetchRequest<Flight *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
