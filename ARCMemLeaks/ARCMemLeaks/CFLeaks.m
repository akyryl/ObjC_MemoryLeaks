//
//  CFLeaks.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/21/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "CFLeaks.h"

@implementation CFLeaks

- (void)leak1
{
    // not released CFCreatedObject
    const int count = 3;
    CFStringRef strs[count];
    CFArrayRef anArray;

    strs[0] = CFSTR("String One");
    strs[1] = CFSTR("String Two");
    strs[2] = CFSTR("String Three");

    anArray = CFArrayCreate(NULL, (void *)strs, count, &kCFTypeArrayCallBacks);
    CFShow(anArray);
    // MEMORY_LEAK: when forget to release CF created object
    
    // FIX:
    // CFRelease(anArray);
    
    // With CG it is not needed
}

- (void)leak2
{
    // not released BridgeRetainedObject
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    
    // you want to manage cf object directly: cf_string is ovner of string, ARC is not managint it anymore
    CFTypeRef cf_dict = (__bridge_retained CFStringRef)dict;
    // or
    // CFStringRef cf_dict = CFBridgingRetain(cf_dict);

    CFShow(cf_dict);

    // MEMORY_LEAK: when you forgot to release it
    
    // FIX: You are responsible for calling CFRelease or a related function to relinquish ownership of the object.
    // CFRelease(cf_dict);
}

@end
