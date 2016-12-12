//
//  ResponseModel.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

@interface ResponseModel : NSObject

@property (nonatomic, readonly, strong) NSNumber *objectId;
@property (nonatomic, readonly, strong) NSString *providerLogo;			// string url
@property (nonatomic, readonly, strong) NSNumber *priceInEuros;
@property (nonatomic, readonly, strong) NSDate	 *departureTime;		// from HH:mm format
@property (nonatomic, readonly, strong) NSDate	 *arrivalTime;			// from HH:mm format
@property (nonatomic, readonly, strong) NSNumber *numberOfStops;
@property (nonatomic, readonly, strong) NSNumber *durationInMinutes;

// parser
- (instancetype)initWithJSONDictionary:(NSDictionary *)dict;

@end
