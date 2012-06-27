//
//  ViewController.h
//  QuickQuiz
//
//  Created by Brandon Callender on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

}
@property (weak, nonatomic) IBOutlet UIWebView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *Left;
@property (weak, nonatomic) IBOutlet UIButton *Right;

@property (strong, nonatomic) NSString *Name;


@end
//test comment