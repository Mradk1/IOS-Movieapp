//
//  SecondViewController.h
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Twitter/Twitter.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface SecondViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    
    UIImageView *imageView;
    BOOL newMedia;
    UIImageView *animation45;
    UIImageView *animation46;
    UIAlertView *objAlertView;
    
}
@property (nonatomic, retain) IBOutlet UIImageView *animation45;
@property (nonatomic, retain) IBOutlet UIImageView *animation46;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction)useCamera;
- (IBAction)useCameraRoll;
-(IBAction)home:(id)sender;
-(IBAction)share:(id)sender;

@end

