//
//  ResponseListModel.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResponseListModel.h"
#import "ResponseModel.h"

@interface ResponseListModel : NSObject

@property (nonatomic, strong, readonly) NSArray<ResponseModel *> *responseObjects;

// Creates ResponseListModel with responseObjects associated with a json array
- (instancetype)initWithJSONArray:(NSArray *)array;

@end
