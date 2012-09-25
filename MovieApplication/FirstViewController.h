//
//  FirstViewController.h
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <iAd/iAd.h>

@interface FirstViewController : UIViewController<AVAudioPlayerDelegate> {
    
    int64_t  currentScore;
    AVAudioPlayer *theAudio;
    NSString* currentLeaderBoard;
    IBOutlet UILabel *currentScoreLabel;
    ADBannerView *banner1;
    UIImageView *animation;
    UIImageView *animation1;
    UIImageView *animation50;
    IBOutlet	UILabel		*theQuestion;
    IBOutlet	UILabel		*theScore;
    IBOutlet	UILabel		*theLives;
    IBOutlet	UIButton	*answerOne;
    IBOutlet	UIButton	*answerTwo;
    IBOutlet	UIButton	*answerThree;
    IBOutlet	UIButton	*answerFour;
    IBOutlet    UIImageView *Scarlett;
    IBOutlet    UIImageView *BradPitt;
    IBOutlet    UIImageView *GeorgeCloney;
    IBOutlet    UIImageView *AngJolie;
    NSInteger Score;
    NSInteger myLives;
    NSInteger questionNumber;
    NSInteger rightAnswer;
    NSInteger time;
    NSArray *theQuiz;
    NSTimer *timer;
    BOOL questionLive;
    BOOL restartGame;
}
@property (nonatomic, assign) BOOL bannerIsVisible;
@property (nonatomic, retain) ADBannerView *banner1;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) UILabel *currentScoreLabel;
@property (retain, nonatomic) UILabel	*theQuestion;
@property (retain, nonatomic) UILabel	*theScore;
@property (retain, nonatomic) UILabel	*theLives;
@property (retain, nonatomic) UIButton	*answerOne;
@property (retain, nonatomic) UIButton	*answerTwo;
@property (retain, nonatomic) UIButton	*answerThree;
@property (retain, nonatomic) UIButton	*answerFour;
@property (retain, nonatomic) NSArray *theQuiz;
@property (retain, nonatomic) NSTimer *timer;
@property (retain, nonatomic) UIImageView	*Scarlett;
@property (retain, nonatomic) UIImageView	*BradPitt;
@property (retain, nonatomic) UIImageView   *GeorgeCloney;
@property (retain, nonatomic) UIImageView	*AngJolie;
@property (nonatomic, retain) IBOutlet UIImageView *animation;
@property (nonatomic, retain) IBOutlet UIImageView *animation1;
@property (nonatomic, retain) IBOutlet UIImageView *animation50;

-(IBAction)home:(id)sender;

-(IBAction) buttonOne;
-(IBAction) buttonTwo;
-(IBAction) buttonThree;
-(IBAction) buttonFour;
-(IBAction) increaseScore;
-(void) checkAchievements;
-(void)updateScore;
-(void)loadQuiz;
-(IBAction)StopAudio;
-(void)countDown;
-(IBAction)AskMe;
@end
