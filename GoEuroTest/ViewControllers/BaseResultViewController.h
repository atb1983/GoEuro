//
//  BaseResultViewController.h
//  GoEuroTest
//
//  Created by Alex Núñez on 11/12/2016.
//  Copyright © 2016. All rights reserved.
//

#import "UIViewController+Extentions.h"
#import "BaseViewModel.h"

@protocol BaseResultViewControllerDelegate <NSObject>
- (void)didTabBarItemSelected:(UITabBarItem *)barItemSelected index:(NSUInteger)index;
@end

@interface BaseResultViewController : UIViewController

@property (strong, nonatomic) BaseViewModel	*model;

@property (weak,  weak) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITabBar		*tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem	*trainTabBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem	*busTabBarItem;
@property (weak, nonatomic) IBOutlet UITabBarItem	*flightTabBarItem;

@property (nonatomic, weak) id <BaseResultViewControllerDelegate>delegate;

@end
