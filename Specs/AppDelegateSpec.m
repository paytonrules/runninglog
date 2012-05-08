#import "OCDSpec/OCDSpec.h"
#import "AppDelegate.h"
#import "LogRunController.h"
#import "ListRunsController.h"
 
CONTEXT(AppDelegate)
{
    describe(@"toBeFailing",
             it(@"adds a log run controller to the root view controller", 
                ^{
                    AppDelegate *delegate = [[AppDelegate alloc] init ];
                    delegate.window = [[UIWindow alloc] init];
                    UITabBarController *tabController = [[UITabBarController alloc] init];
                    delegate.window.rootViewController = tabController;
                    
                    [delegate application:nil didFinishLaunchingWithOptions:nil];
                    
                    LogRunController *cont = [tabController.viewControllers objectAtIndex:0];
                    
                    [expect(cont.nibName) toBeEqualTo:@"AddLogView"];
                }),
             
             it(@"adds a listRuns controller to the root view controller",
                ^{
                    AppDelegate *delegate = [[AppDelegate alloc] init ];
                    delegate.window = [[UIWindow alloc] init];
                    UITabBarController *tabController = [[UITabBarController alloc] init];
                    delegate.window.rootViewController = tabController;
                    
                    [delegate application:nil didFinishLaunchingWithOptions:nil];
                    
                    ListRunsController *cont = [tabController.viewControllers objectAtIndex:1];
                    
                    [expect(cont.nibName) toBeEqualTo:@"ListRunsView"];    
                    
                }),
             
             
             nil); // Don't forget the terminating nil
}