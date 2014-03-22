//
//  ObjectWithBlock.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "ObjectWithBlock.h"

@implementation ObjectWithBlock


- (void)leak
{
    // FIX of retaining cycle
    // __weak ObjectWithBlock *weakSelf = self;

    self.completionBlock = ^{

        // MEMORY_LEAK: retaining cycle
        // block has strong refference on self and self has strong reference on block
        [self cleaningMethod];

        // FIX: we need keep weak reference on self in block
        // [weakSelf cleaningMethod];

        // FIX: if you need access properties keep object alive
        // ObjectWithBlock *strongSelf = weakSelf;
        // strongSelf.blockResult = 0;
    };

    [self longRunMethod];
}

- (void)cleaningMethod
{
    
}

- (void)longRunMethod
{
    
}

- (void)otherMethodWithBlockInside
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        // should be everything OK here as self does not have strong reference on block
        self.blockResult = 0;
    });
}

@end
