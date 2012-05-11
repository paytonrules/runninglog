//
//  ListRunsController.h
//  runningLog
//
//  Created by Eric Smith on 5/8/12.
//  Copyright (c) 2012 8th Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogRunInteractor.h"

@interface ListRunsController : UIViewController<UITableViewDataSource>
{
    NSObject<LogRunInteractor> *interactor;
}

-(id) initWithNibName:(NSString *)nibNameOrNil interactor:(NSObject<LogRunInteractor> *)interactor;
@end
