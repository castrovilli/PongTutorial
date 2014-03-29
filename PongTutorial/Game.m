//
//  Game.m
//  PongTutorial
//
//  Created by Tom Miller on 3/28/14.
//  Copyright (c) 2014 Tom Miller. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)Collision{
    
    if (CGRectIntersectsRect(Ball.frame, Player.frame)) {
        
        Y = arc4random() %5;
        Y = 0-Y;
    }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame)) {
        
        Y = arc4random() %5;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    if (Player.center.y > 530) {
        Player.center = CGPointMake(Player.center.x, 530);
    }
    
    if (Player.center.y < 530) {
        Player.center = CGPointMake(Player.center.x, 530);
    }
    
    if (Player.center.x < 50) {
        Player.center = CGPointMake(50, Player.center.y);
    }
    
    if (Player.center.x > 246) {
        Player.center = CGPointMake(246, Player.center.y);
    }
}

-(void)ComputerMovement {
    
    if (Computer.center.x > Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x -2, Computer.center.y);
    }
    
    if (Computer.center.x < Ball.center.x){
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    if (Computer.center.x < 50) {
        Computer.center = CGPointMake(50, Computer.center.y);
    }
    
    if (Computer.center.x > 246) {
        Computer.center = CGPointMake(246, Computer.center.y);
    }
    
    
    
    
    
}



-(IBAction)StartButton:(id)sender{
    
    StartButton.hidden = YES;
    // Hides the the start button
    
    Y = arc4random() % 11;
    Y = Y - 5;
    
    X = arc4random() % 11;
    X = X - 5;
    
    if (Y == 0){
        Y = 1;
    }
    
    if (X == 0){
        X = 1;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
}

-(void)BallMovement{
    
    [self ComputerMovement];
    [self Collision];
    
    // Determins the movment of the Ball

    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    // Makes sure the Ball bounces off the wall. 15 and 305 determine the edge of the Ball and the wall. If 0 and 310, the ball would go halfway in through the wall.
    
    if (Ball.center.x < 50) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 305) {
        X = 0 - X;
    }
    
    
    
    
    if (Ball.center.y < 0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        
        Ball.center = CGPointMake(145, 256);
        
        if (PlayerScoreNumber == 10){
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinorLose.hidden = NO;
            WinorLose.text = [NSString stringWithFormat:@"You Win!"];
        }
        
    }
    
    if (Ball.center.y > 560) {
        ComputerScoreNumber =  ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        [timer invalidate];
        StartButton.hidden = NO;
        Ball.center = CGPointMake(145, 256);
        
        if (ComputerScoreNumber == 1) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinorLose.hidden = NO;
            WinorLose.text = [NSString stringWithFormat:@"You lose!"];
        }
    }
    
    
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
