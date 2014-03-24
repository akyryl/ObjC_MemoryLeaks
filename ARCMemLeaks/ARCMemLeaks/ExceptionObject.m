//
//  ExceptionObject.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/24/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "ExceptionObject.h"

@interface MyObject : NSObject

@property (nonatomic, copy) NSArray *array;

@end

@implementation ExceptionObject

- (void)leak
{
    @try
    {
        // We have array prepared
        NSMutableArray *arr = [NSMutableArray new];
        [arr addObject:@"one"];
        [arr addObject:@"two"];
        
        // assume something wrong with object and now it is nil
        MyObject *object = nil;

        if (object == nil)
        {
            [NSException raise:@"Invalid object value" format:@""];
        }
        // ARC does not clean this array and in case of exception it will be mem leak
        object.array = arr;
        
        // FIX: A program may be compiled with the option -fobjc-arc-exceptions
    }
    @catch(NSException *theException)
    {
        // TODO: handle exception
    }
    @finally
    {
    }
}

@end
