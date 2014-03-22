//
//  ObjectOne.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "ObjectOne.h"

#import "ObjectTwo.h"


@implementation ObjectOne

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        _objectTwo = [[ObjectTwo alloc] init];
    }
    return self;
}

- (void)leak
{
    // MEMORY_LEAK:
    // Object two has strong reference on object one
    // and object one has strong reference on object two
    
    // One of objects won't be released.
    _objectTwo.objectOne = self;
}

@end
