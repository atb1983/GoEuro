//
//  AppDelegate.m
//  GoEuroTest
//
//  Created by Alex Núñez on 10/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "AppDelegate.h"
#import "GoEuroTest-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
		
	[Theme apply];
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[CoredataController shared] saveContext];
}

@end
