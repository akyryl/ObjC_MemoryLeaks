//
//  BridgeLeaks.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/22/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "BridgeLeaks.h"

@implementation BridgeLeaks


- (void)leak
{
    // NSObject just for example. Here can be any custom object
    NSObject *obj1;
    NSObject *obj2;

    obj1 = [NSObject new];

    // for example we need strong reference on object to prevent it from deleting untill p is used
    // so we use __bridge_retained to transfer ownership
    void *p = (__bridge_retained void *)obj1;

    // setting object to nil, but ojbect is not released as p has strong reference on it.
    obj1 = nil;
    
    // p pointer is still valid and we can use it.

    // Than we want to transfer void * pointer to object pointer
    
    // MEMORY_LEAK with ARC & GC: memory of allocated NSObject never be release as ovnership not transfered
    obj2 = (__bridge NSObject *)p;

    // FIX: we need to transfer ovnership to obj2, so ARC can handle it
    // obj2 = (__bridge_transfer NSObject *)p;
}

@end
