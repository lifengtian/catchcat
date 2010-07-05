//
//  circleView.h
//  catchcat
//
//  Created by Lifeng on 6/12/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ROW 11
#define COL 11
#define WIDTH 25.0f

int board[ROW][COL];
static int catx=5;
static int caty=5;

 NSMutableArray *board_array;


@interface circleView : UIImageView {
    CGPoint startLocation;
    BOOL clicked;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event ;

-(void) setClicked:(BOOL) flag;
-(BOOL) getClicked ;
-(void) catWin:(BOOL)w;

-(void) catMove_odd;
-(void) catMove_even;

@end
