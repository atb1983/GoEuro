//
//  ResponseModel.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResponseModel.h"

static NSString* const GoEuroDateTimeFormat = @"HH:mm";

@implementation ResponseModel

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict {
	self = [super init];
	if (self) {
		
		// parsing objects
		_objectId		= @([dict[@"id"] integerValue]);
		_providerLogo	= dict[@"provider_logo"];
		_priceInEuros	= @([dict[@"price_in_euros"] doubleValue]);
		_departureTime	= [self dateWithGoEuroString:dict[@"departure_time"]];
		_arrivalTime	= [self dateWithGoEuroString:dict[@"arrival_time"]];
		_numberOfStops	= dict[@"number_of_stops"];
		
		_durationInMinutes = [self diffBetweenTwoDates:_departureTime date2:_arrivalTime];
	}
	
	return self;
}

#pragma mark - Helpers

- (NSDate *)dateWithGoEuroString:(NSString *)string {
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"HH:mm"]; // go euro specific format
	return [format dateFromString:string];
}

// Returns minutes betwen two dates
- (NSNumber *)diffBetweenTwoDates:(NSDate *)date1 date2:(NSDate *)date2 {
	NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitMinute fromDate: date1 toDate: date2 options: 0];
	return @([components minute]);
}


@end
