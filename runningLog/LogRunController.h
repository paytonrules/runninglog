#import <UIKit/UIKit.h>
#import "LogRunInteractor.h"

@interface LogRunController : UIViewController
{
  IBOutlet UITextField *logEntry;
  NSObject<LogRunInteractor> *interactor;
}

@property(nonatomic, retain) UITextField *logEntry;

-(IBAction) addLog;
-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField;
-(id) initWithNibName:(NSString *)nibNameOrNil andInteractor:(NSObject<LogRunInteractor> *)interactor;

@end
