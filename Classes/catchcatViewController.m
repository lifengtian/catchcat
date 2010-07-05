//
//  catchcatViewController.m
//  catchcat
//
//  Created by Lifeng on 6/12/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "catchcatViewController.h"

@implementation catchcatViewController



CGPoint randomPoint() {return CGPointMake (random() % 256, random() % 396 ); }


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    CGRect appRect = [[UIScreen mainScreen] applicationFrame];
    contentView = [[UIView alloc] initWithFrame:appRect];
    contentView.backgroundColor = [UIColor whiteColor];
    self.view = contentView;
    [contentView release];
    
    board_array = [[NSMutableArray alloc] init];
    
    NSLog(@"hello in loadView");
    for (int m=0; m<ROW; m++) {
        for (int n=0; n<COL; n++) {
            board[m][n]=0;
        }
    }
    
    //Add the flowers to random points for run
    for (int i = 0; i< ROW; i++)
    {
        for (int j = 0; j < COL; j++) { // j is x horizontal
        CGRect circleRect = CGRectMake(0.0f, 0.0f, WIDTH, WIDTH);
        //circleRect.origin = randomPoint();
            if ( i % 2 == 1) {
            circleRect.origin = CGPointMake(WIDTH*j+WIDTH/2, WIDTH*i);
            } else {
                circleRect.origin = CGPointMake(WIDTH*j, WIDTH*i);
                
            }
        circleView *circle = [[circleView alloc] initWithFrame:circleRect];
            [circle setClicked:FALSE];
            [circle setUserInteractionEnabled:YES];
        
            if (i==5 && j==5){
                [circle setImage: [UIImage imageNamed:@"cat.png"]];
            } else {
                [circle setImage: [UIImage imageNamed:@"yellowCircle.png"]];
            }
            
            [board_array insertObject:circle atIndex:i*ROW+j];

        [contentView addSubview:circle];
            NSLog(@"insert object at %i %@\n",i*COL+j, circle);
            //[board_array addObject:circle];
            
        //[circle release];
    }
    }
    
    
        
}



/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
