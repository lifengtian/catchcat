//
//  circleView.m
//  catchcat
//
//  Created by Lifeng on 6/12/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "circleView.h"



@implementation circleView

-(void) catWin:(BOOL)win
{
    CGRect circleRect = CGRectMake(0.0f, 0.0f, WIDTH*(ROW+1), WIDTH*(ROW+1));
    //circleRect.origin = ;
 circleRect.origin = CGPointMake(0.0f, 0.0f);
    
    circleView *circle = [[circleView alloc] initWithFrame:circleRect];
    [circle setClicked:FALSE];
    [circle setUserInteractionEnabled:YES];

    if ( win ) {
    [circle setImage: [UIImage imageNamed:@"catwin.png"]];
    } else {
        [circle setImage: [UIImage imageNamed:@"catlose.png"]];

    }

    [[self superview] addSubview:circle];
    
    
}
-(void) catMove_odd
{
    int r;
    int total = 0;
    int x,y;
    x = catx;
    y = caty;
    
    if (catx==0 || caty==0 || catx == COL - 1 || caty == ROW - 1) {
        NSLog(@"You lose! ");
        [self catWin:TRUE];
        return;
    }
    if (board[caty][catx-1]==1) {
        total++;
    }
    if (board[caty][catx+1]==1){
        total++;
    }
    if ( board[caty-1][catx-1]==1){
        total++;
    }
    if ( board[caty-1][catx]==1){
        total++;
    }
    if (board[caty+1][catx-1]==1) {
        total++;
    }
    if (board[caty+1][catx]==1) {
        total++;
    }
    
    if (total == 6 ){
        NSLog(@"You win!");
        [self catWin:FALSE];
        return ;
    }
   
  do {
      catx=x;
      caty=y; 
    r = random() % 6;
    //look at all possible position
    switch (r) {
        case 0: //left
            catx-=1;
            break;
        case 1: // right
            catx+=1;
            break;
        case 2: //up-left
            caty-=1;catx-=1;
            break;
        case 3: //up
            caty-=1;
            break;
        case 4: //down-left
            caty+=1;catx-=1;
            break;
        case 5: //down
            caty+=1;
            break;
    }
  } while (board[caty][catx]==1) ;

}

-(void) catMove_even
{
    int r;
    int total = 0;
    int x,y;
    x = catx;
    y = caty;
    
    if (catx==0 || caty==0 || catx == COL - 1 || caty == ROW - 1) {
        NSLog(@"You lose! ");
        [self catWin:TRUE];
        return;
    }
    if (board[caty][catx-1]==1) {
        total++;
    }
    if (board[caty][catx+1]==1){
        total++;
    }
    if ( board[caty-1][catx]==1){
        total++;
    }
    if ( board[caty-1][catx+1]==1){
        total++;
    }
    if (board[caty+1][catx]==1) {
        total++;
    }
    if (board[caty+1][catx+1]==1) {
        total++;
    }
    
    if (total == 6 ){
        NSLog(@"You win!");
        [self catWin:FALSE];
        return ;
    }
    
    do {
        catx=x;
        caty=y; 
        r = random() % 6;
        //look at all possible position
        switch (r) {
            case 0: //left
                catx-=1;
                break;
            case 1: // right
                catx+=1;
                break;
            case 2: //up
                caty-=1;
                break;
            case 3: //up+right
                caty-=1;catx+=1;
                break;
            case 4: //down
                caty+=1;
                break;
            case 5: //down+right
                caty+=1;catx+=1;
                break;
        }
    } while (board[caty][catx]==1) ;
    
}


-(void) setClicked: (BOOL) flag
{
    clicked = flag;
}

-(BOOL) getClicked
{
    return clicked;   
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int p,q;
    circleView *c;
    
     CGRect frame = [self frame];
    

     q= (int) (frame.origin.y/25.0);  // y is the ROW
    if (q % 2 == 1 ) {
        p=(int) ((frame.origin.x-WIDTH/2)/25.0) ;
    } else {
        p=(int) ((frame.origin.x)/25.0) ;
        
    }
    //CGPoint pt = [[touches anyObject] locationInView:self];
    [[self superview] bringSubviewToFront:self];
    
   
    NSLog(@"touches! %f %f", frame.origin.x,frame.origin.y);
    if ([self getClicked] == FALSE ) {
        [self setClicked:TRUE];
        if (p==catx && q==caty) {
            NSLog(@"You can't kill the cat. He is here!%i\n",[self getClicked]);
        } else {
           // [self setImage: [UIImage imageNamed:@"greenCircle.png"]];
            [self setImage: [UIImage imageNamed:@"mouse.png"]];
            
            board[q][p] = 1;
            NSLog(@"board[%d, %d] is %d\n",q, p,  board[q][p] );
            
            
            //once touched, move the cat!
            c = [board_array objectAtIndex:(caty*ROW+catx)];
            [ c setImage: [UIImage imageNamed:@"yellowCircle.png"]];
            // move
            NSLog(@"Will move from %d %d ",catx,caty);
            if ( caty % 2 == 1 ) {
                [self catMove_even];NSLog(@"Even\n");
            } else {
                [self catMove_odd ]; NSLog(@"odd\n");
            }

            // 
           
                NSLog(@"to %d %d \n",catx,caty);
                c = [board_array objectAtIndex:(caty*ROW+catx)];
                [ c setImage: [UIImage imageNamed:@"cat.png"]];
                //NSLog(@"view status is %@ %i",[board_array objectAtIndex:(catx*COL+caty)], catx*COL+caty);
            
        }
        
    } else {
        NSLog(@"Row %d Col %d was clicked\n",(int) (frame.origin.x/25.0), (int) (frame.origin.y/25.0));
    }
    
}



@end
