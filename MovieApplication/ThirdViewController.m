//
//  ThirdViewController.m
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "ThirdViewController.h"
#import "MasterViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)TweetMe{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/#!/AskMeMatty1"]];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)dealloc
{
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
