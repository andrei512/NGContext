//
//  NGAppDelegate.m
//  NGContext
//
//  Created by Andrei on 9/16/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NGAppDelegate.h"

#import "NGViewController.h"
#import "NGContext.h"
#import "NGList.h"
#import "NGEvent.h"

@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NGList *list = [NGList list];

    [list on:nil do:^(NGEvent *event) {
        NSLog(@"%@", event);
    }];
    
    [list post:@"Hello World!"];
    
    for (int i = 0; i < 10; ++i) {
        [list insertObject:@(10-i) atIndex:i];
    }
    
    [list removeObject:@3];
    
    
    
    /*kode/
    */
                                                                                                                                                            NSLog(@"hidden code!");
    
    /*jeg*/
    
    
    
    
    
    
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[NGViewController alloc] initWithNibName:@"NGViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

// crafted by Koder www.koder-tools.com
