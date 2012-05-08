#import "OCDSpec/OCDSpec.h"
#import "AppDelegate.h"
#import "LogViewController.h"
 
CONTEXT(AppDelegate)
{
    describe(@"toBeFailing",
             it(@"adds a view controller to the root view controller", 
                ^{
                    // Check that the tab controller gets its needed subcontrollers
                    // Of course you'll need to setup the tab controller/window on the appDelegate
                    AppDelegate *delegate = [[AppDelegate alloc] init ];
                    delegate.window = [[UIWindow alloc] init];
                    UITabBarController *tabController = [[UITabBarController alloc] init];
                    delegate.window.rootViewController = tabController;
                    
                    [delegate application:nil didFinishLaunchingWithOptions:nil];
                    
                    LogViewController *cont = [tabController.viewControllers objectAtIndex:0];
                    
                    [expect(cont.nibName) toBeEqualTo:@"AddLogView"];
                }),
             
             nil); // Don't forget the terminating nil
}