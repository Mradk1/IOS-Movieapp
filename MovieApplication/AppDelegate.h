//
//  AppDelegate.h
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@class MasterViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MasterViewController *viewController;



@end
