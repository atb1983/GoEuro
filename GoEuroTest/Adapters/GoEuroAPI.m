//
//  GoEuroAPI.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "GoEuroAPI.h"
#import <AFNetworking/AFNetworking.h>

NSString *const APIBaseURL		= @"https://api.myjson.com/bins";
NSString *const EndPointFlights	= @"w60i";
NSString *const EndPointBuses	= @"3zmcy";
NSString *const EndPointTrains	= @"37yzm";

@implementation GoEuroAPI

+ (void)getResultWithType:(TypeTrip)TypeTrip completion:(void (^)(ResponseListModel *model, NSError *error))completion {
	switch (TypeTrip) {
		case TypeTrip_Buses:
			[self fetchDataFromURL:[self combineBaseURLWithEndPoint:EndPointBuses] completion:completion];
			break;
		case TypeTrip_Trains:
			[self fetchDataFromURL:[self combineBaseURLWithEndPoint:EndPointTrains] completion:completion];
			break;
		case TypeTrip_Flights:
			[self fetchDataFromURL:[self combineBaseURLWithEndPoint:EndPointFlights] completion:completion];
	}
}

+ (void)fetchDataFromURL:(NSString *)urlString completion:(void (^)(ResponseListModel *model, NSError *error))completion {
	AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
	[manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
		[self parseResult:responseObject completion:completion];
	} failure:^(NSURLSessionTask *operation, NSError *error) {
		completion(nil, error);
	}];
}

+ (void)getImageWithURL:(NSString *)imageUrl completion:(void (^)(NSData *imageData, NSError *error))completion {
	
	NSURLSession * session = [NSURLSession sharedSession];
	NSURL *url = [NSURL URLWithString:imageUrl];
	
	NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		NSData *imageData = [NSData dataWithContentsOfURL:url];
		completion(imageData, error);
	}];
	
	[dataTask resume];
}

#pragma mark - Parsers

+ (void)parseResult:(NSData *)responseData completion:(void (^)(ResponseListModel *model, NSError *error))completion {
	
	if (![responseData isKindOfClass:[NSArray class]]) {
		NSString *errorMessage = [NSString stringWithFormat:@"There was an error reading the feed."];
		NSError *jsonErrorWithMessage = [[NSError alloc] initWithDomain:@"Networking Error" code:0 userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
		
		completion(nil, jsonErrorWithMessage);
	}
	else {
		ResponseListModel *model = [[ResponseListModel alloc] initWithJSONArray:(NSArray *)responseData];
		completion(model, nil);
	}
}

#pragma mark - Helpers

+ (NSString *)combineBaseURLWithEndPoint:(NSString *)endpoint {
	return [NSString stringWithFormat:@"%@/%@", APIBaseURL, endpoint];
}

@end
