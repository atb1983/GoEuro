//
//  ImageCacheController.m
//  AlexFranco
//
//  Created by Alex Núñez on 20/11/2016.
//  Copyright © 2016. All rights reserved.
//

#import "ImageCacheController.h"

@interface ImageCacheController ()

@property (nonatomic, strong) NSMutableDictionary*imagesDictionary;

@end

@implementation ImageCacheController

+ (instancetype)shared {
	static ImageCacheController *_sharedname = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedname = [[self alloc] init];
	});
	
	return _sharedname;
}

- (void)getImageFromUrl:(NSString *)imageUrl asynchronouslyForImageView:(UIImageView *)imageView andKey:(NSString *)key {
	
	if (self.imagesDictionary[key])  {
		[self animatedSetImageWithImageView:imageView image:self.imagesDictionary[key]];
		return;
	}
	
	// Very simple image downloader I usually use SDWebImage or similars but just for trying to avoid too many 3rd party for this exercise
	[GoEuroAPI getImageWithURL:imageUrl completion:^(NSData *imageData, NSError *error) {
		
		dispatch_sync(dispatch_get_main_queue(), ^{
			
			UIImage *newImage;
			
			if (imageData) {
				if (!self.imagesDictionary) {
					self.imagesDictionary = [NSMutableDictionary dictionary];
				}
				
				self.imagesDictionary[key] = [UIImage imageWithData:imageData];
				newImage = self.imagesDictionary[key];
			} else {
				newImage = [UIImage imageNamed:@"GoEuroLogo.jpg"]; // place holder
			}
			
			[self animatedSetImageWithImageView:imageView image:newImage];
		});
	}];
}

- (void)animatedSetImageWithImageView:(UIImageView *)imageView image:(UIImage *)image {
	[UIView transitionWithView:imageView
					  duration:1.0f
					   options:UIViewAnimationOptionTransitionCrossDissolve
					animations:^{
						imageView.image = image;
					} completion:nil];
}

@end
