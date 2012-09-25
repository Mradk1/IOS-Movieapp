//
//  SecondViewController.m
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "SecondViewController.h"
#import <Twitter/Twitter.h>
#import "MasterViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize animation45;
@synthesize animation46;
@synthesize imageView;

- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}

- (IBAction)share:(id)sender
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet =
        [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"Tweeting from AskMeMovies !!!! : )"];
        [tweetSheet addImage:image];
        [self presentModalViewController:tweetSheet animated:YES];
    }
}

- (void) useCamera
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ScreenShot"
                                                    message:@"Take a photo of your Face !!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            [self presentModalViewController:imagePicker
                                    animated:YES];
            [imagePicker release];
            newMedia = YES;
        }
    }
}
- (void) useCameraRoll
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ScreenShot"
                                                    message:@"Take a photo of your Face !!!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
    [alert release];
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                      (NSString *) kUTTypeImage,
                                      nil];
            imagePicker.allowsEditing = NO;
            [self presentModalViewController:imagePicker animated:YES];
            [imagePicker release];
            newMedia = NO;
        }
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    [self dismissModalViewControllerAnimated:YES];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        
        imageView.image = image;
        if (newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
		// Code here to support video if enabled
	}
}
-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"\
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc
{
    [imageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    NSArray *image =[NSArray arrayWithObjects:
                     [UIImage imageNamed:@"flash1.tiff"],
                     [UIImage imageNamed:@"flash2.tiff"],
                     [UIImage imageNamed:@"flash3.tiff"],
                     [UIImage imageNamed:@"flash4.tiff"],
                     [UIImage imageNamed:@"flash6.tiff"],
                     [UIImage imageNamed:@"flash7.tiff"],
                     [UIImage imageNamed:@"flash8.tiff"],
                     [UIImage imageNamed:@"flash9.tiff"],
                     [UIImage imageNamed:@"flash10.tiff"],
                     [UIImage imageNamed:@"flash11.tiff"],
                     [UIImage imageNamed:@"flash12.tiff"],
                     [UIImage imageNamed:@"flash13.tiff"],
                     [UIImage imageNamed:@"flash14.tiff"],
                     [UIImage imageNamed:@"flash15.tiff"],
                     [UIImage imageNamed:@"flash16.tiff"],
                     [UIImage imageNamed:@"flash17.tiff"],nil];
    animation45.animationImages = image;
    animation45.animationDuration = 2.00;
    animation45.animationRepeatCount = 0;
    
    [animation45 startAnimating];
    NSArray *image1 =[NSArray arrayWithObjects:
                      [UIImage imageNamed:@"flash1.tiff"],
                      [UIImage imageNamed:@"flash2.tiff"],
                      [UIImage imageNamed:@"flash3.tiff"],
                      [UIImage imageNamed:@"flash4.tiff"],
                      [UIImage imageNamed:@"flash6.tiff"],
                      [UIImage imageNamed:@"flash7.tiff"],
                      [UIImage imageNamed:@"flash8.tiff"],
                      [UIImage imageNamed:@"flash9.tiff"],
                      [UIImage imageNamed:@"flash10.tiff"],
                      [UIImage imageNamed:@"flash11.tiff"],
                      [UIImage imageNamed:@"flash12.tiff"],
                      [UIImage imageNamed:@"flash13.tiff"],
                      [UIImage imageNamed:@"flash14.tiff"],
                      [UIImage imageNamed:@"flash15.tiff"],
                      [UIImage imageNamed:@"flash16.tiff"],
                      [UIImage imageNamed:@"flash17.tiff"],nil];
    animation46.animationImages = image1;
    animation46.animationDuration = 2.00;
    animation46.animationRepeatCount = 0;
    
    [animation46 startAnimating];
    [super viewDidLoad];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
