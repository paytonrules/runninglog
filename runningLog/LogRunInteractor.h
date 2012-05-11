//
//  LogRunInteractor.h
//  runningLog
//
//  Created by Eric Smith on 5/8/12.
//  Copyright (c) 2012 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogRunInteractor <NSObject>
-(void) log:(NSString *) runInfo;
-(NSString*) getLogAt:(NSInteger) index;

@property(readonly) NSInteger logEntries;

@end
