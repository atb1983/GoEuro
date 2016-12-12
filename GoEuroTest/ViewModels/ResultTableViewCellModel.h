//
//  ResultTableViewCellModel.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "GenericTrip+CoreDataClass.h"

@interface ResultTableViewCellModel : NSObject

@property (strong, nonatomic, readonly) NSString	*logoUrl;
@property (strong, nonatomic, readonly) NSString	*departureArriveText;
@property (strong, nonatomic, readonly) NSString	*durationText;
@property (strong, nonatomic, readonly) NSString	*numberOfStopsText;

@property (nonatomic, strong, readonly) NSString	*priceIntegerPart;
@property (nonatomic, strong, readonly) NSString	*priceDecimalPart;

- (instancetype)initWithGenericTrip:(GenericTrip *)coredataObject;

@end
