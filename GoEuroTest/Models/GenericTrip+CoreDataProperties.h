//
//  GenericTrip+CoreDataProperties.h
//  GoEuroTest
//
//  Created by Alex on 12/12/2016.
//  Copyright © 2016 Nice. All rights reserved.
//

#import "GenericTrip+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GenericTrip (CoreDataProperties)

+ (NSFetchRequest<GenericTrip *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *arrivalTime;
@property (nullable, nonatomic, copy) NSDate *departureTime;
@property (nonatomic) int16_t durationInMinutes;
@property (nullable, nonatomic, copy) NSString *logoUrl;
@property (nonatomic) float priceInEuros;
@property (nonatomic) int16_t tripId;
@property (nonatomic) int16_t stops;

@end

NS_ASSUME_NONNULL_END
