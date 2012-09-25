//
//  MasterViewController.m
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "MasterViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController
@synthesize animation;
@synthesize animation1;
@synthesize banner, bannerIsVisible;

- (void)bannerViewDidLoadAd:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner. frame, 0.0, 50.0);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}
- (void)bannerView:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(banner. frame, 0.0, -320.0);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (IBAction)view1:(id)sender
{
	FirstViewController *second =[[FirstViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}

- (IBAction)view2:(id)sender
{
	SecondViewController *second =[[SecondViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}

- (IBAction)view3:(id)sender
{
	ThirdViewController *second =[[ThirdViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)appStoreLink {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/pages/AskMeGames/340633016006061"]];
}
- (IBAction)Tweetthis:(id)sender {
    if([TWTweetComposeViewController canSendTweet]){
        NSLog(@"Twitter framework is available on the device");
        
        (NSClassFromString(@"TWTweetComposeViewController"));
        NSLog(@"Twitter framework is available on the device");
        
        TWTweetComposeViewController *twitterComposer = [[TWTweetComposeViewController alloc]init];
        [self presentModalViewController:twitterComposer animated:YES];
    }
    // twitter is not available on device
}

-(IBAction)fandangoLink {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/fandango-movies-times-tickets/id307906541?mt=8"]];
}

- (void)dealloc{
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad{
    NSArray *image =[NSArray arrayWithObjects:
                     [UIImage imageNamed:@"Popcorn1.tiff"],
                     [UIImage imageNamed:@"Popcorn2.tiff"],
                     [UIImage imageNamed:@"Popcorn3.tiff"],
                     [UIImage imageNamed:@"Popcorn4.tiff"],
                     [UIImage imageNamed:@"Popcorn6.tiff"],
                     [UIImage imageNamed:@"Popcorn7.tiff"],
                     [UIImage imageNamed:@"Popcorn8.tiff"],
                     [UIImage imageNamed:@"Popcorn9.tiff"],
                     [UIImage imageNamed:@"Popcorn10.tiff"],
                     [UIImage imageNamed:@"Popcorn11.tiff"],
                     [UIImage imageNamed:@"Popcorn12.tiff"],nil];
    animation.animationImages = image;
    animation.animationDuration = 2.00;
    animation.animationRepeatCount = 0;
    
    [animation startAnimating];
    {
        NSArray *image1 =[NSArray arrayWithObjects:
                          [UIImage imageNamed:@"Popcorn1.tiff"],
                          [UIImage imageNamed:@"Popcorn2.tiff"],
                          [UIImage imageNamed:@"Popcorn3.tiff"],
                          [UIImage imageNamed:@"Popcorn4.tiff"],
                          [UIImage imageNamed:@"Popcorn6.tiff"],
                          [UIImage imageNamed:@"Popcorn7.tiff"],
                          [UIImage imageNamed:@"Popcorn8.tiff"],
                          [UIImage imageNamed:@"Popcorn9.tiff"],
                          [UIImage imageNamed:@"Popcorn10.tiff"],
                          [UIImage imageNamed:@"Popcorn11.tiff"],
                          [UIImage imageNamed:@"Popcorn12.tiff"],nil];
        animation1.animationImages = image1;
        animation1.animationDuration = 2.00;
        animation1.animationRepeatCount = 0;
        
        [animation1 startAnimating];
        [super viewDidLoad];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
