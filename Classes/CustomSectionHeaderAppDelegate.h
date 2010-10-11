//
//  CustomSectionHeaderAppDelegate.h
//  CustomSectionHeader
//
//  Created by Samuel Ryan Goodwin on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSectionHeaderViewController;

@interface CustomSectionHeaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CustomSectionHeaderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CustomSectionHeaderViewController *viewController;

@end

