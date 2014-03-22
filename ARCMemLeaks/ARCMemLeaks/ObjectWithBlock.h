//
//  ObjectWithBlock.h
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectWithBlock : NSObject

@property (nonatomic, assign) NSInteger blockResult;
@property (nonatomic, strong) void(^completionBlock)(void);

- (void)leak;
- (void)cleaningMethod;
- (void)longRunMethod;

- (void)otherMethodWithBlockInside;

@end
