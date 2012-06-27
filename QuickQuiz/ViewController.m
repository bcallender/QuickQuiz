//
//  ViewController.m
//  QuickQuiz
//
//  Created by Brandon Callender on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;
@synthesize resultLabel;
@synthesize Left;
@synthesize Right;
@synthesize Name;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadPicture];
  
    
}
- (void)loadPicture
{
    //Main Dictionary: this contains the urls for the images and the 'names' of the people
    NSDictionary *mainDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"http://blogs.honeywellsecurity.com/content/uploads/2011/11/John-Smith1.jpg", @"Johnny Appleseed",
                              @"http://cnhsg.net/images659/Meg%20Brown.jpg", @"Meg Brown",
                              @"http://api.ning.com/files/*p1hq6Wg1OkS*NhHSvy*0q1MyaQhLISN1bfx0R8nYDS68QZkjCLixr1iRndthxmSSVn6fFiS-iUyTTQjzPwOK3Y3jrc31Qt0FdbAJmG49gA_/matt_dallas_kyle_xy.jpg", @"Kyle Chron",
                              @"http://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Jack_Layton_-_2011.jpg/220px-Jack_Layton_-_2011.jpg", @"Jack Davies",
                              @"http://static.dailystrength.org/groupfiles/1/6/2/1/10001261/g_1944756615.jpg", @"Lily Evans",
                              @"http://ia.media-imdb.com/images/M/MV5BNDg3Nzk5NTQyN15BMl5BanBnXkFtZTcwNTA4ODI2Mw@@._V1._SX640_SY360_.jpg", @"Dora Finkelstein",@"https://pictures.dealer.com/a/airportcdjcllc/1289/0b853c144046387200489c420a31a180.jpg", @"Eric Graves",@"http://taijiacupuncture.com/images/jane-hilton-headshot.jpg", @"Jane Hilton",nil];
    NSLog(@"Test");
    //generates a random number beween 0 and the max index of the dictionary, and uses that to pick which name/image will be used. Looks up the name and URLizes the current URL
    int r = arc4random() % [mainDict count];
    NSString *currentName = [[NSString alloc] initWithString:[[mainDict allKeys] objectAtIndex:r]];
    NSString *currentURL = [[NSString alloc] initWithString:[mainDict objectForKey:currentName]];
    NSURL *url = [[NSURL alloc] initWithString:currentURL];
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
    [imageView loadRequest:req];
    self.Name = currentName;
    int ri = arc4random() % [mainDict count];
    int rans = arc4random() % 6;
    //populates the answer buttons
    if(rans <= 2){ 
    [Left setTitle:currentName forState:UIControlStateNormal];
        if ([[[mainDict allKeys] objectAtIndex:ri] isEqualToString:currentName]) {
            [Right setTitle:[[NSString alloc] initWithString:[[mainDict allKeys] objectAtIndex:ri-1]] forState:UIControlStateNormal];
        }else{
            [Right setTitle:[[NSString alloc] initWithString:[[mainDict allKeys] objectAtIndex:ri]] forState:UIControlStateNormal];}}
    else {
        [Right setTitle:currentName forState:UIControlStateNormal];
        if ([[[mainDict allKeys] objectAtIndex:ri] isEqualToString:currentName]) {
            [Left setTitle:[[NSString alloc] initWithString:[[mainDict allKeys] objectAtIndex:ri-1]] forState:UIControlStateNormal];
        }else{
            [Left setTitle:[[NSString alloc] initWithString:[[mainDict allKeys] objectAtIndex:ri]] forState:UIControlStateNormal];}
    }
}
- (IBAction)LeftClick:(id)sender {
    if ([Left.titleLabel.text isEqualToString:self.Name]) {
        resultLabel.text = @"Success!";
        [self loadPicture];
    }
    else {
        resultLabel.text = @"Failure...";
        [self loadPicture];
    }
}
- (IBAction)RightClick:(id)sender {
    if ([Right.titleLabel.text isEqualToString:self.Name]) {
        resultLabel.text = @"Success!";
        [self loadPicture];
    }
    else {
        resultLabel.text = @"Failure...";
        [self loadPicture];
    }

}




- (void)viewDidUnload
{

    [self setImageView:nil];
    [self setResultLabel:nil];
    [self setLeft:nil];
    [self setRight:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
