//
//  GoEuroTestTests.m
//  GoEuroTestTests
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ResponseListModel.h"

@interface GoEuroTestTests : XCTestCase

@end

@implementation GoEuroTestTests

- (void)testCreateResponseListModelWithEmptyData {
	NSArray *test = @[];
	ResponseListModel *list = [[ResponseListModel alloc] initWithJSONArray:test];
	XCTAssertNotNil(list);
	
	XCTAssertNotNil(list.responseObjects);

	list = [[ResponseListModel alloc] initWithJSONArray:nil];
	XCTAssertNotNil(list);
}

- (void)testResponseModelWithOnlyStringData
{
	NSDictionary *testDict = @{
							   @"id": @"string",
							   @"provider_logo": @"string",
							   @"price_in_euros": @"price_in_euros",
							   @"departure_time": @"departure_time",
							   @"arrival_time": @"arrival_time",
							   @"number_of_stops": @"number_of_stops"
							   };
	
	XCTAssertNotNil([[ResponseModel alloc] initWithJSONDictionary:testDict]);
}

- (void)testDepartureTimeParser {
	NSDictionary *testDict = @{
							   @"departure_time": @"22:16",
							   };
	
	ResponseModel *model = [[ResponseModel alloc] initWithJSONDictionary:testDict];
	XCTAssertNotNil(model.departureTime);
}

- (void)testArrivalTimeParser {
	NSDictionary *testDict = @{
							   @"arrival_time": @"10:16",
							   };
	
	ResponseModel *model = [[ResponseModel alloc] initWithJSONDictionary:testDict];
	XCTAssertNotNil(model.arrivalTime);
}

- (void)testDurationCorrect {
	NSDictionary *testDict = @{
							   @"departure_time": @"11:15",
							   @"arrival_time": @"12:00",
							   };
	ResponseModel *model = [[ResponseModel alloc] initWithJSONDictionary:testDict];
	XCTAssertEqual(model.durationInMinutes.intValue, 45);
}

- (void)testDurationInCorrect {
	NSDictionary *testDict = @{
							   @"departure_time": @"11:20",
							   @"arrival_time": @"12:00",
							   };
	ResponseModel *model = [[ResponseModel alloc] initWithJSONDictionary:testDict];
	XCTAssertNotEqual(model.durationInMinutes.intValue, 45);
}


@end
