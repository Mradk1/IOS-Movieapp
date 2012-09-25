//
//  MasterViewController.h
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import <Twitter/Twitter.h>

@interface MasterViewController : UIViewController <ADBannerViewDelegate>{
    ADBannerView *banner;
    UIImageView *animation;
    UIImageView *animation1;
    UIAlertView *objAlertView;
}

@property (nonatomic, retain) IBOutlet UIImageView *animation;
@property (nonatomic, retain) IBOutlet UIImageView *animation1;
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, retain) ADBannerView *banner;
- (IBAction)view1:(id)sender;
- (IBAction)view2:(id)sender;
- (IBAction)view3:(id)sender;
-(IBAction)appStoreLink;
-(IBAction)fandangoLink;
-(IBAction)Tweetthis:(id)sender;
@end