//
//  ResultTableViewCell.h
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResultTableViewCellModel.h"
#import "ImageCacheController.h"
#import "GenericTrip+CoreDataClass.h"

@interface ResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView	*logoImageView;
@property (weak, nonatomic) IBOutlet UILabel		*departureArriveLabel;
@property (weak, nonatomic) IBOutlet UILabel		*priceLabel;
@property (weak, nonatomic) IBOutlet UILabel		*durationLabel;

- (void)setupCellWithGenericTrip:(GenericTrip *)GenericTrip;

@end
