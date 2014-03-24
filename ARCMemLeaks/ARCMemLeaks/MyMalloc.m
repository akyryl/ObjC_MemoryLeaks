//
//  MyMalloc.m
//  ARCMemLeaks
//
//  Created by akyryl on 3/24/14.
//  Copyright (c) 2014 Anatolii. All rights reserved.
//

#import "MyMalloc.h"

@implementation MyMalloc

- (void)leak
{
    size_t buff_size = 64;
    char *buff = (char *)malloc(buff_size);
    
    int n = 0;
    for (int i = 0; i < buff_size; ++i,++n)
    {
        buff[i] = rand() % 26 + 'a';
    }
    buff[n]='\0';

    printf ("Random string: %s\n",buff);
    // MEMORY_LEAK with ARC & GC: leak if not to free buff
    
    // FIX: release C allocated memory manually, ARC not control this.
    // free(buff);
}

@end
