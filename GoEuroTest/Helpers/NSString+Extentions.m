//
//  NSString+Extentions.m
//  AlexFranco
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "NSString+Extentions.h"

@implementation NSString (Extentions)

+ (NSString *)decimalStringWithNumber:(NSNumber *)number {
	return [[self decimalFormat] stringFromNumber:number];
}

+ (NSNumberFormatter *)decimalFormat {
	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	formatter.numberStyle = NSNumberFormatterDecimalStyle;
	formatter.minimumFractionDigits = 2;
	formatter.maximumFractionDigits = 2;
	
	return formatter;
}


@end
