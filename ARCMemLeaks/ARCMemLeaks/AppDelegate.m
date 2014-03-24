//
//  AppDelegate.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "AppDelegate.h"

#import "BridgeLeaks.h"
#import "CFLeaks.h"
#import "ExceptionObject.h"
#import "MyMalloc.h"
#import "ObjectOne.h"
#import "ObjectWithBlock.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self memLeakExamples];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)memLeakExamples
{
    // 1
    CFLeaks *cfLeaks = [CFLeaks new];
    [cfLeaks leak1];
    [cfLeaks leak2];

    // 2
    BridgeLeaks *bridgeLeaks = [BridgeLeaks new];
    [bridgeLeaks leak];
    
    // 3
    ObjectOne *objectOne = [ObjectOne new];
    [objectOne leak];
    
    // 4
    ObjectWithBlock *objectWithBlock = [ObjectWithBlock new];
    [objectWithBlock leak];
    
    // 5
    MyMalloc *myAlloc = [MyMalloc new];
    [myAlloc leak];
    
    // 6
    ExceptionObject *exceptionObject = [ExceptionObject new];
    [exceptionObject leak];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
