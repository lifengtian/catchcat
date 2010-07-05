//
//  catchcatAppDelegate.h
//  catchcat
//
//  Created by Lifeng on 6/12/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class catchcatViewController;

@interface catchcatAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    catchcatViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet catchcatViewController *viewController;

@end

