//
//  FakeLogRunInteractor.m
//  runningLog
//
//  Created by Eric Smith on 5/8/12.
//  Copyright (c) 2012 8th Light. All rights reserved.
//

#import "FakeLogRunInteractor.h"

@implementation FakeLogRunInteractor

@synthesize logs;

-(id) init
{
    if ((self = [super init]))
    {
        logs = [NSMutableArray array];
    }
    return self;
}

-(void) log:(NSString *)runInfo
{
    [logs addObject:runInfo]; 
}

-(NSInteger) logEntries
{
    return [logs count];
}

-(NSString *) getLogAt:(NSInteger) index
{
    return [logs objectAtIndex:index];
}

@end
