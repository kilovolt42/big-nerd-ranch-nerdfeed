//
//  BNRAppDelegate.m
//  Nerdfeed
//
//  Created by Kyle Stevens on 3/4/14.
//  Copyright (c) 2014 kilovolt42. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	BNRCoursesViewController *cvc = [[BNRCoursesViewController alloc] initWithStyle:UITableViewStylePlain];
	UINavigationController *masterNav = [[UINavigationController alloc] initWithRootViewController:cvc];
	
	BNRWebViewController *wvc = [[BNRWebViewController alloc] init];
	cvc.webViewController = wvc;
	
	// Check to make sure we are running on the iPad
	if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
		// webViewController must be in navigation controller; you will see why later
		UINavigationController *detailNav = [[UINavigationController alloc] initWithRootViewController:wvc];
		
		UISplitViewController *svc = [[UISplitViewController alloc] init];
		
		// Set the delegate of the split view controller to the detail VC
		// You will need this later - ignore the warning for now
		svc.delegate = wvc;
		
		svc.viewControllers = @[masterNav, detailNav];
		
		// Set the root view controller of the window to the split view controller
		self.window.rootViewController = svc;
	} else {
		// On non-iPad devices, just use the navigation controller
		self.window.rootViewController = masterNav;
	}
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
