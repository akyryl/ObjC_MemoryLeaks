//
//  ObjectOne.h
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ObjectTwo;


@interface ObjectOne : NSObject

@property (nonatomic, strong) ObjectTwo *objectTwo;

- (void)leak;

@end
