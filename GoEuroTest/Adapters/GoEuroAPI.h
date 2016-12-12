//
//  GoEuroAPI.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResponseListModel.h"

typedef NS_ENUM(NSInteger, TypeTrip) {
	TypeTrip_Flights,
	TypeTrip_Buses,
	TypeTrip_Trains,
};

@interface GoEuroAPI : NSObject

+ (void)getResultWithType:(TypeTrip)TypeTrip completion:(void (^)(ResponseListModel *model, NSError *error))completion;
+ (void)getImageWithURL:(NSString *)imageUrl completion:(void (^)(NSData *imageData, NSError *error))completion;

@end
