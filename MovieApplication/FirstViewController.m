//
//  FirstViewController.m
//  MovieApplication
//
//  Created by matthew radke on 9/24/12.
//  Copyright (c) 2012 matthew radke. All rights reserved.
//

#import "FirstViewController.h"
#import "MasterViewController.h"
#import "Time.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize animation;
@synthesize animation1;
@synthesize animation50;
@synthesize theQuestion;
@synthesize theScore;
@synthesize theLives;
@synthesize answerOne;
@synthesize answerTwo;
@synthesize answerThree;
@synthesize answerFour;
@synthesize theQuiz;
@synthesize timer;
@synthesize Scarlett;
@synthesize BradPitt;
@synthesize GeorgeCloney;
@synthesize AngJolie;
@synthesize banner1, bannerIsVisible;
@synthesize currentScore;
@synthesize currentScoreLabel;
#define RANDOM_SEED() srandom(time(NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % 57((__MAX__+1) - (__MIN__)))

- (void)bannerViewDidLoadAd:(ADBannerView *)abanner1 {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        banner1.frame = CGRectOffset(banner1. frame, 0.0, 50.0);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}
- (void)bannerView:(ADBannerView *)abanner {
    if(!self.bannerIsVisible){
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        banner1.frame = CGRectOffset(banner1. frame, 0.0, -320.0);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}
- (IBAction)home:(id)sender
{
	MasterViewController *second =[[MasterViewController alloc] initWithNibName:nil bundle:nil];
	[self presentModalViewController:second animated:YES];
}
-(IBAction)AskMe {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/themoderngrad/id527054811?mt=8"]];
}
-(void)askQuestion
{
    // Unhide all the answer buttons.
    [Scarlett setHidden:NO];
    [BradPitt setHidden:NO];
    [GeorgeCloney setHidden:NO];
    [AngJolie setHidden:NO];
    [answerOne setHidden:NO];
    [answerTwo setHidden:NO];
    [answerThree setHidden:NO];
    [answerFour setHidden:NO];
    
    // Set the game to a "live" question (for timer purposes)
    questionLive = YES;
    
    // Set the time for the timer
    time = 25.0;
    
    // Go to the next question
    questionNumber = random() % 57;
    
    NSInteger row = 0;
    
    if (questionNumber == 1)
    {
        questionNumber = random() % 57;
    }
    else
    {
        questionNumber = random() % 57;
    }
    
    // Set the question string, and set the buttons the the answers
    NSArray *question = [theQuiz objectAtIndex:questionNumber];
    NSString *activeQuestion = [question objectAtIndex:0];
    [answerOne setTitle:[question objectAtIndex:+1] forState:UIControlStateNormal];
    [answerTwo setTitle:[question objectAtIndex:+2] forState:UIControlStateNormal];
    [answerThree setTitle:[question objectAtIndex:+3] forState:UIControlStateNormal];
    [answerFour setTitle:[question objectAtIndex:+4] forState:UIControlStateNormal];
    rightAnswer = [[question objectAtIndex:row+5] intValue];
    theQuestion.text = activeQuestion;
    // Start the timer for the countdown
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    
    [activeQuestion release];
}

-(void)updateScore
{
    // If the score is being updated, the question is not live
    questionLive = NO;
    
    [timer invalidate];
    
    // Hide the answers from the previous question
    [Scarlett setHidden:YES];
    [BradPitt setHidden:YES];
    [GeorgeCloney setHidden:YES];
    [AngJolie setHidden:YES];
    [answerOne setHidden:YES];
    [answerTwo setHidden:YES];
    [answerThree setHidden:YES];
    [answerFour setHidden:YES];
    NSString *scoreUpdate = [[NSString alloc] initWithFormat:@"Score: %d",Score];
    theScore.text = scoreUpdate;
    currentScoreLabel.text = scoreUpdate;
    
    [scoreUpdate release];
    
    // END THE GAME.
    NSInteger endOfQuiz = [theQuiz count];
    if((((questionNumber - 1) * 6) + 6) == endOfQuiz)
    {
        // Game is over.
        if(Score > 0)
        {
            NSString *finishingStatement = [[NSString alloc] initWithFormat:@"That's game!\nNice going Hollywood You should be on the Big Screen \nYou scored %i!", Score];
            theQuestion.text = finishingStatement;
            [finishingStatement release];
            
        }
        else
        {
            NSString *finishingStatement = [[NSString alloc] initWithFormat:@"That's game!\nWow. You're terrible! \nYou scored %i.", Score];
            theQuestion.text = finishingStatement;
            [finishingStatement release];
            
        }
        theLives.text = @"";
        
        // Make button 1 appear as a reset game button
        restartGame = YES;
        [answerOne setHidden:NO];
        [answerOne setTitle:@"Restart the game" forState:UIControlStateNormal];
        
    }
    else
    {
        // Give a short rest between questions
        time = 7.0;
        
        // Initialize the timer
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
}

-(void)countDown
{
    // Question live counter
    if(questionLive==YES)
    {
        time = time - 1;
        theLives.text = [NSString stringWithFormat:@"Time remaining: %i!", time];
        
        if(time == 0)
        {
            // Loser!
            questionLive = NO;
            theQuestion.text = @"Sorry, you ran out of time!";
            Score = Score - 10;
            currentScore = currentScore -10;
            [timer invalidate];
            [self updateScore];
        }
    }
    // In-between Question counter
    else
    {
        time = time - 1;
        theLives.text = [NSString stringWithFormat:@"Next question in...%i!", time];
        
        if(time == 0)
        {
            [timer invalidate];
            theLives.text = @"";
            [self askQuestion];
        }
    }
    if(time < 0)
    {
        [timer invalidate];
    }
}


- (IBAction)buttonOne
{
    if(questionNumber == 0){
        [answerTwo setHidden:NO];
        [answerThree setHidden:NO];
        [answerFour setHidden:NO];
        [self askQuestion];
    }
    else
    {
        NSInteger theAnswerValue = 1;
        [self checkAnswer:(int)theAnswerValue];
        if(restartGame==YES)
        {
            // Create a restart game function.
        }
    }
}

- (IBAction)buttonTwo
{
    NSInteger theAnswerValue = 2;
    [self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonThree
{
    NSInteger theAnswerValue = 3;
    [self checkAnswer:(int)theAnswerValue];
}

- (IBAction)buttonFour
{
    NSInteger theAnswerValue = 4;
    [self checkAnswer:(int)theAnswerValue];
}

-(void)checkAnswer:(int)theAnswerValue

{
    if(rightAnswer == theAnswerValue)
    {
        theQuestion.text = @"Wow You Are Pretty Smart! Good work.";
        Score = Score + 10;
        currentScore = currentScore + 10;
        {
            NSArray *image =[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"ASKMOV11.gif"],
                             [UIImage imageNamed:@"ASKMOV11.1.gif"],
                             [UIImage imageNamed:@"ASKMOV11.2.gif"],
                             [UIImage imageNamed:@"ASKMOV12.gif"],
                             [UIImage imageNamed:@"ASKMOV13.gif"],
                             [UIImage imageNamed:@"ASKMOV14.gif"],
                             [UIImage imageNamed:@"ASKMOV15.gif"],
                             [UIImage imageNamed:@"ASKMOV16.gif"],
                             [UIImage imageNamed:@"ASKMOV17.gif"],nil];
            animation50.animationImages = image;
            animation50.animationDuration = 1.25;
            animation50.animationRepeatCount = 1;
            
            [animation50 startAnimating];
            {
                NSString *path = [[NSBundle mainBundle] pathForResource:@"My Song" ofType:@"mp3"];
                theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
                theAudio.delegate=self;
                theAudio.volume = 0.01;
                theAudio.numberOfLoops = 0;
                [theAudio play];
                
            }
        }
    }
    
    else
    {
        theQuestion.text = @"HAH!, nice try you need to work alittle harder!";
        Score = Score - 10;
        currentScore = currentScore - 10;
        {
            NSString *path = [[NSBundle mainBundle] pathForResource:@"My Laugh" ofType:@"mp3"];
            theAudio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            theAudio.delegate=self;
            theAudio.volume = 0.01;
            theAudio.numberOfLoops = 0;
            [theAudio play];
            
        }
    }
    [self updateScore];
    [self updatecurrentScore];
}
- (void) updatecurrentScore
{
    [self updateScore];
}
#pragma mark Action Methods
- (void) addTen;
{
	self.currentScore= self-> Score + 10;
	[self updatecurrentScore];
}
- (IBAction) increaseScore
{
    self.currentScore = self.currentScore + 0;
    currentScoreLabel.text = [NSString stringWithFormat: @"%lld", self.currentScore];
}
-(IBAction)StopAudio  {
    [theAudio stop];
}

- (void)dealloc {
	[theQuestion release];
	[theScore release];
	[theLives release];
	[answerOne release];
	[answerTwo release];
	[answerThree release];
	[answerFour release];
    [Scarlett release];
	[BradPitt release];
	[GeorgeCloney release];
	[AngJolie release];
    [theQuiz release];
	[timer release];
    [currentScoreLabel release];
    [theAudio release];
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
    [super viewDidLoad];
    questionLive = NO;
    restartGame = NO;
    theQuestion.text = @"Welcome to AskMeMovie Trivia! Think you know the Movies better than your friends, huh? Lets see how Smart you are!";
    theScore.text = @"Score:0";
    currentScoreLabel.text =  @"Score:0";
    theLives.text = @"";
    questionNumber = 0;
    Score = 0;
    myLives = 0;
    [answerOne setTitle:@"Let's Play!" forState:UIControlStateNormal];
    [answerTwo setHidden:YES];
    [answerThree setHidden:YES];
    [answerFour setHidden:YES];
    [GeorgeCloney setHidden:YES];
    [AngJolie setHidden:YES];
    [Scarlett setHidden:YES];
    [self loadQuiz];
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
    
}

-(void)loadQuiz{
    // NSArray initWithContentsOfFile
    NSArray *quizArray = [[ NSArray alloc] initWithObjects:
                          [NSArray arrayWithObjects:@" Which one of these movies was Johnny Depp not a part of?", @"Sleepy Hollow", @"Corpse Bride",@"Arizona Dream", @"Star Wars III", @"4",nil],
                          [NSArray arrayWithObjects:@" In which film does a penguin named Mumble not have a heart song but instead is wonderful at tap dancing?", @"Happy Feet", @"The Lion King", @"Open Season", @"Penguin Day", @"1", nil],
                          [NSArray arrayWithObjects:@" Name the man who played Davy Jones in the movie Pirates Of The Caribbean-Dead Mans Chest.", @"Johnny Depp", @"Billy Bob Thorton", @"Ted Elliott", @"Bill Nighy", @"4", nil],
                          [NSArray arrayWithObjects:@" In The Lion King Hakuna Matata means?", @"Pride", @"No Worries", @"Good Morals", @"Dignity", @"2", nil],
                          [NSArray arrayWithObjects:@" In the movie The parent trap, where did the two twins meet?", @"At Home", @"In School", @"At Summer Camp", @"A Birthday Party", @"3", nil],
                          [NSArray arrayWithObjects:@" What Pet Does Jennifer Aniston Own in Along Came Polly?", @"A Mink", @"A Ferret", @"An Otter", @"An Iguana", @"2", nil],
                          [NSArray arrayWithObjects:@" What state is Forrest Gump from?", @"Mississippi", @"Iowa", @"Alabama", @"Alaska", @"3", nil],
                          [NSArray arrayWithObjects:@"   In the Notebook who was the main person that did not want Noah and Ally to be together?", @"Noah's best friend", @"Ally's Mother", @"Noahs Boss", @"Ally's maid", @"2", nil],
                          [NSArray arrayWithObjects:@"  What is the name of the turtle in finding nemo?", @"Brush", @"Crush", @"Drush", @"Crash", @"2", nil],
                          [NSArray arrayWithObjects:@" Data, Sloth, Chuck, Andy, Mouth, Mikey and Brand are from which movie?", @"Spy Kids", @"Home Alone", @"Fluke", @"The Goonies", @"4",nil],
                          [NSArray arrayWithObjects:@"   In which movie did a 16 year old run away from home, become a pilot, a doctor, and a lawer, while forging money on the run from the FBI all before his 19th birthday?", @"Runaway Bride", @"Catch Me if you can", @"Runaway Jury", @"Titanic", @"2", nil],
                          [NSArray arrayWithObjects:@"   In Mr. Smith goes to Washington which actor played Senator Smith", @"John Wayne", @"James Stewart", @"Fred Astaire", @"Clark Gable", @"2", nil],
                          [NSArray arrayWithObjects:@" In the Wizard of Oz which of the following does Dorothy meet first?", @"Tin Man", @"Lion", @"Scarecrow", @"Glinda", @"4", nil],
                          [NSArray arrayWithObjects:@" In the Mighty Ducks, what city was Goldberg from?", @"New York", @"Houston", @"Philadelphia", @"San Francisco", @"3", nil],
                          [NSArray arrayWithObjects:@" In what country did Black Hawk Down take place?", @"Ethiopia", @"Iraq", @"Somalia", @"Sudan", @"3", nil],
                          [NSArray arrayWithObjects:@" In Miracle who did the U.S. defeat to win the gold medal?", @"Soviet Union", @"Norway", @"Sweden", @"Finland", @"4", nil],
                          [NSArray arrayWithObjects:@" What Adam Sandler comedy features Bob Barker’s screen debut?", @"Happy Gilmore", @"Mr. Deeds", @"AngerManagement", @"Wedding Singer", @"1", nil],
                          [NSArray arrayWithObjects:@" How many hubcaps does Steve McQueen’s car lose in the famed chase scene from Bullitt?", @"0", @"2", @"4", @"6", @"4", nil],
                          [NSArray arrayWithObjects:@" What was the name of the rich banker from It’s A Wonderful Life?", @"Mr. Scrooge", @"Mr. Gecko", @"Mr. Potter", @"Mr. Moneybags", @"3", nil],
                          [NSArray arrayWithObjects:@" What Clint Eastwood screen role was originally offered to John Wayne, Frank Sinatra and Paul Newman?", @"The Man With No Name", @"Dirty Harry", @"The Good/Bad and the Ugly", @"Play Misty for Me", @"2", nil],
                          [NSArray arrayWithObjects:@"  What movie earned Tom Hanks his third straight Oscar nomination in 1996?", @"Saving Private Ryan", @"Apollo 13", @"Green Mile", @"That Thing You Do", @"2", nil],
                          [NSArray arrayWithObjects:@" What Sylvester Stallone movie was hyped His whole life was a million-to-one shot?", @"Rambo", @"Rocky", @"The Lords of Flatbush", @"Tango and Cash", @"2", nil],
                          [NSArray arrayWithObjects:@" In the movie Hoosiers, who did Hickory play in the State Championship", @"SouthBend Central", @"Indianapolis", @"Monroe", @"Hancock", @"1", nil],
                          [NSArray arrayWithObjects:@" In the Man Who Shot Liberty Valance, what was Ransom Stoddard’s profession?", @"Rancher", @"Banker", @"Lawyer",@"Sheriff", @"3", nil],
                          [NSArray arrayWithObjects:@" In the Little Giants who did the Little Giants play", @"Cardinals", @"Steelers", @"Redskins", @"Cowboys", @"4", nil],
                          [NSArray arrayWithObjects:@" In Euro Trip in what city does Scotty finally meet Mieke", @"London", @"Paris", @"Madrid", @"Rome", @"4", nil],
                          [NSArray arrayWithObjects:@" In Field of Dreams what state was the field built in?", @"Nebraska", @"Iowa", @"South Dakota", @"Kansas", @"2", nil],
                          [NSArray arrayWithObjects:@" What MLB team does Moneyball portray?", @"A's", @"Yankees", @"Giants", @"White Sox", @"1", nil],
                          [NSArray arrayWithObjects:@" In what city does Lost in Translation take place?", @"New York", @"Singapore", @"Tokyo", @"Beijing", @"3", nil],
                          [NSArray arrayWithObjects:@" If you are a teenager living on Elm Street what should you never do?", @"Drink", @"Sleep", @"Swim", @"Trick or Treat", @"2", nil],
                          [NSArray arrayWithObjects:@" Béla Lugosi was a Hungarian/American actor best known for his portrayal of what monster?", @"Dracula", @"Frankenstein", @"Werewolf", @"Alien", @"1", nil],
                          [NSArray arrayWithObjects:@" What movie has both Tim Allen, and Tom Hanks", @"Wild Hogs", @"Joe Somebody", @"Toy Story", @"That Thing You Do", @"3", nil],
                          [NSArray arrayWithObjects:@" What blond sex symbol of the 1990s claims to have an IQ of 154?", @"Michelle Pfeiffer", @"nichole kidman", @"sharon stone", @"Meg Ryan", @"3", nil],
                          [NSArray arrayWithObjects:@" What 1991 Disney animated feature was hyped as the most beautiful love story ever told?", @"Pocohontis", @"Beauty and the Beast", @"Cinderella", @"Lion King", @"2", nil],
                          [NSArray arrayWithObjects:@" What Michelle Pfeiffer movie got a boost from the Coolio song Gangsta's Paradise?", @"Dangerous Minds", @"The Age of Innocence", @"One  Fine Day", @"The Story of Us", @"1", nil],
                          [NSArray arrayWithObjects:@" Arnold Schwarzenegger married the niece of which US president?", @"Raegon", @"Carter", @"Ford", @"Kennedy", @"4", nil],
                          [NSArray arrayWithObjects:@" What was the name of Michael Douglas's father?", @"Kevin", @"Kip", @"Jason", @"Kirk", @"4", nil],
                          [NSArray arrayWithObjects:@" Which Oscar winner for From Here To Eternity, more famous as Ol Blue Eyes the singer, died in 1998?", @"Montgomery Clift", @"Burt Lancaster", @"Frank Sinatra", @"Phillip Ober", @"3", nil],
                          [NSArray arrayWithObjects:@"  In the Lord of the Rings, Sauron’s territory is called?", @"The Shire", @"Isengard", @"Mordor", @"Rohan", @"3", nil],
                          [NSArray arrayWithObjects:@"  What is the highest grossing movie in history worldwide", @"Titanic", @"Marvel’s The Avengers", @"Avatar", @"Harry Potter and the Deathly Hallows pt.2", @"3", nil],
                          [NSArray arrayWithObjects:@" Since 1982 what movie spent the most weekends #1 at the box office?", @"Titanic", @"Home Alone", @"The Sixth Sense", @"E.T.", @"4", nil],
                          [NSArray arrayWithObjects:@" In Rocky who is Rocky’s first fight shown in the movie against?", @"Apollo Creed", @"Spider Rico", @"Clubber Lang", @"Ivan Drago", @"2", nil],
                          [NSArray arrayWithObjects:@" In the Lion King how is Scar related to Mufasa?", @"Father", @"Cousin", @"Brother", @"Son", @"3", nil],
                          [NSArray arrayWithObjects:@"What was the first James Bond to be played by Pierce Brosnan", @"Die Another Day", @"Goldeneye", @"License to Kill", @"The World is not Enough", @"2", nil],
                          [NSArray arrayWithObjects:@"How many Nightmare On Elm Street movies were made in the eighties?", @"2", @"3", @"4", @"5", @"4", nil],
                          [NSArray arrayWithObjects:@"What is the name of Marty’s band that tries out for the dance in Back to the Future", @"The Dorks", @"The Knuckleheads", @"The Brats", @"The Pinheads", @"4", nil],
                          [NSArray arrayWithObjects:@"In  The Goonies what brand of candybar did Chunk try to give to Sloth?", @"Baby Ruth", @"Snickers", @"Butterfinger", @"Three Musketeers", @"1", nil],
                          [NSArray arrayWithObjects:@"In Running Scared how much money does Billy Crystal’s character inherit from his aunt Rosie?", @"25K", @"50K", @"100K", @"200K", @"2", nil],
                          [NSArray arrayWithObjects:@"What does Ally Sheedy say she likes to drink in the Breakfast Club?", @"Vodka", @"Water", @"Pepsi", @"Orange Juice", @"1", nil],
                          [NSArray arrayWithObjects:@"What is the robot’s name in short circuit 1 - 2", @"Joey", @"Timmy", @"Johnny", @"Billy", @"3", nil],
                          [NSArray arrayWithObjects:@"What is the occupation of Tom Hanks’ character in Bachelor Party?", @"Police officer", @"Teacher", @"School bus driver", @"Janitor", @"3", nil],
                          [NSArray arrayWithObjects:@"What Cheers actor was in Empire Strikes Back?", @"Rhea Perlman", @"Ted Danson", @"John Ratzenberger", @"Woody Harrelson", @"3", nil],
                          [NSArray arrayWithObjects:@"Who does Robin Williams play in Night At The Museum?", @"George Washington", @"Teddy Roosevelt", @"Abraham Lincoln", @"Ronal Reagan", @"2", nil],
                          [NSArray arrayWithObjects:@"In Grease what is Rizzo’s first name?", @"Rizzo", @"Betty", @"Betsy", @"Sammie", @"2", nil],
                          [NSArray arrayWithObjects:@"In Saturday Night Fever what is the letter of the train that passes by at the beginning of the movie?", @"A", @"B", @"C", @"D", @"2", nil],
                          [NSArray arrayWithObjects:@"In Citizen Kane what is Susan’s occupation?", @"Lawyer", @"Doctor", @"Bartender", @"Singer", @"4", nil],
                          [NSArray arrayWithObjects:@"How many people died in the Magnificent Seven?", @"7", @"24", @"43", @"55", @"4", nil],
                          [NSArray arrayWithObjects:@"In Remember The Titans how many wins did T.C. Williams have?", @"10", @"11", @"12", @"13", @"4", nil], nil];
    self.theQuiz = quizArray;
    [quizArray release];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.currentScoreLabel = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
