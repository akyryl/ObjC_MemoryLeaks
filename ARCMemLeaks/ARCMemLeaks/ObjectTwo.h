//
//  ObjectTwo.h
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ObjectOne;


@interface ObjectTwo : NSObject

@property (nonatomic, strong) ObjectOne *objectOne;

@end
