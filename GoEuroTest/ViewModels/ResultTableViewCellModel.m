//
//  ResultTableViewCellModel.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResultTableViewCellModel.h"
#import "GenericTrip+CoreDataClass.h"
#import "NSString+Extentions.h"

@implementation ResultTableViewCellModel

- (instancetype)initWithGenericTrip:(GenericTrip *)coredataObject {
	self = [super init];
	if (self) {
		_logoUrl				=	coredataObject.logoUrl;
		_departureArriveText	=	[NSString stringWithFormat:@"%@ - %@",
									[self dateWithGoEuroString:coredataObject.departureTime],
									[self dateWithGoEuroString:coredataObject.arrivalTime]];
		
		NSString *integerPart = [self integerPartOfNumber:@(coredataObject.priceInEuros)];
		_priceIntegerPart =  [NSString stringWithFormat:@"€%@", integerPart];
		
		NSString *decimalPart = [self decimalPartOfNumber:@(coredataObject.priceInEuros)];
		_priceDecimalPart = [NSString stringWithFormat:@".%@", decimalPart];
				
		_numberOfStopsText		= [NSString stringWithFormat:@"%hd Stops", coredataObject.stops];
		
		NSString *numberOfStops = coredataObject.stops < 2 ? numberOfStops = @"Direct" : [NSString stringWithFormat:@"%hd Stops", coredataObject.stops];
		
		NSString *formattedDuration = [self formatedDurationInMinutes:coredataObject.durationInMinutes];
		_durationText = [NSString stringWithFormat:@"%@ %@h", numberOfStops, formattedDuration];
	}
	
	return self;
}

- (NSString *)formatedDurationInMinutes:(int)durationInMinutes {
	int totalSeconds = durationInMinutes * 60;
	int minutes = (totalSeconds / 60) % 60;
	int hours = totalSeconds / 3600;
	
	return [NSString stringWithFormat:@"%02ld:%02ld", (long)hours, (long)minutes];
}

- (NSString *)integerPartOfNumber:(NSNumber *)number {
	NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
	[format setNumberStyle:NSNumberFormatterNoStyle];
	return [format stringFromNumber:number];
}

- (NSString *)decimalPartOfNumber:(NSNumber *)number {
	NSNumberFormatter *format = [NSString decimalFormat];
	NSString *fullAmount = [format stringFromNumber:number];
	NSRange range = [fullAmount rangeOfString:format.decimalSeparator];
	
	return [fullAmount substringFromIndex:range.location + 1];
}

- (NSString *)dateWithGoEuroString:(NSDate *)date {
	NSDateFormatter *format = [[NSDateFormatter alloc] init];
	[format setDateFormat:@"HH:mm"];
	return [format stringFromDate:date];
}

@end
