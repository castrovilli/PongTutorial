//
//  Game.h
//  PongTutorial
//
//  Created by Tom Miller on 3/28/14.
//  Copyright (c) 2014 Tom Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
int X;
int ComputerScoreNumber;
int PlayerScoreNumber;



@interface Game : UIViewController

{

    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Computer;
    
    IBOutlet UILabel *PlayerScore;
    IBOutlet UILabel *ComputerScore;
    IBOutlet UILabel *WinorLose;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *LetMeOut;
    
    NSTimer *timer;

}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
-(void)ComputerMovement;
-(void)Collision;

@end
