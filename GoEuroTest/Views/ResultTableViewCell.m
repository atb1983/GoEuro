//
//  ResultTableViewCell.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ResultTableViewCell.h"
#import "ResultTableViewCellModel.h"

@interface ResultTableViewCell()

@property (nonatomic, strong) ResultTableViewCellModel *model;
@end

@implementation ResultTableViewCell

- (void)setupCellWithGenericTrip:(GenericTrip *)GenericTrip {
	
	self.model	= [[ResultTableViewCellModel alloc] initWithGenericTrip:GenericTrip];
	
	self.departureArriveLabel.text		= self.model.departureArriveText;
	self.durationLabel.text				= self.model.durationText;
	
	[self stylePriceLabel];
	
	[[ImageCacheController shared] getImageFromUrl:self.model.logoUrl
						asynchronouslyForImageView:self.logoImageView
											andKey:[self.model.logoUrl lastPathComponent]];
}


// this method sets label price with integer in bigger font than the deccimal part.
- (void)stylePriceLabel {
	
	NSString *bigText	= self.model.priceIntegerPart;
	NSString *smallText = self.model.priceDecimalPart;
	
	UIFont *integerFont = [UIFont systemFontOfSize:18.0f];
	NSDictionary *integerFontDict = [NSDictionary dictionaryWithObject:integerFont forKey:NSFontAttributeName];
	NSMutableAttributedString *priceTextAttributes = [[NSMutableAttributedString alloc] initWithString:bigText attributes: integerFontDict];
	
	UIFont *decimalFont = [UIFont systemFontOfSize:14.0f];
	NSDictionary *verdanaDict = [NSDictionary dictionaryWithObject:decimalFont forKey:NSFontAttributeName];
	NSMutableAttributedString *decimalAttributes = [[NSMutableAttributedString alloc]initWithString:smallText attributes:verdanaDict];
	[priceTextAttributes appendAttributedString:decimalAttributes];
	
	self.priceLabel.attributedText = priceTextAttributes;
}

@end
