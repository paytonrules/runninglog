#import <UIKit/UIKit.h>

@interface LogRunController : UIViewController<UITableViewDataSource>
{
  IBOutlet UITextField *logEntry;
  IBOutlet NSMutableArray *logEntries;
}

@property(nonatomic, retain) UITextField *logEntry;

-(IBAction) addLog;
-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField;
@end
