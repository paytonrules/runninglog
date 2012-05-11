//
//  FakeLogRunInteractor.h
//  runningLog
//
//  Created by Eric Smith on 5/8/12.
//  Copyright (c) 2012 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogRunInteractor.h"

@interface FakeLogRunInteractor : NSObject<LogRunInteractor>
{
    NSMutableArray *logs;
}
@property(readonly) NSArray *logs;

@end
