//
//  catchcatViewController.h
//  catchcat
//
//  Created by Lifeng on 6/12/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "circleView.h"

static circleView  *board_obj[ROW][COL];

@interface catchcatViewController : UIViewController {
    // Jun 12, 2010
    UIView *contentView;
}

@end

