//
//  ImageCacheController.h
//  AlexFranco
//
//  Created by Alex Núñez on 20/11/2016.
//  Copyright © 2016. All rights reserved.
//

@interface ImageCacheController : NSObject

+ (instancetype)shared;

// Very Simple method for lazy image loading
- (void)getImageFromUrl:(NSString *)imageUrl asynchronouslyForImageView:(UIImageView *)imageView andKey:(NSString *)key;

@end
