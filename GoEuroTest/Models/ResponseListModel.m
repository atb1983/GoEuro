//
//  ResponseListModel.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResponseListModel.h"

@implementation ResponseListModel

- (instancetype)initWithJSONArray:(NSArray *)array {
	self = [super init];
	if (self) {
		
		NSMutableArray<ResponseModel *> *newResults = [NSMutableArray array];
		
		for (NSDictionary *modelCandidate in array) {
			ResponseModel *model = [[ResponseModel alloc] initWithJSONDictionary:modelCandidate];
			
			// if the model is nil we just ignore it and don't added to our new results list
			if (model) {
				[newResults addObject:model];
			}
		}
		
		_responseObjects = [newResults copy]; // not mutable array
	}
	
	return self;
}

@end
