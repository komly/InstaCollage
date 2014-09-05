//
//  KMAppDelegate.m
//  InstaCollage
//
//  Created by Дмитрий on 05.09.14.
//  Copyright (c) 2014 Петров Дмитрий. All rights reserved.
//

#import "KMAppDelegate.h"
#import "KMInstagramManager.h"

@implementation KMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Init manager
    [KMInstagramManager sharedManager];
    return YES;
}


@end
