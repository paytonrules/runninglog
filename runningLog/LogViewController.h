#import <UIKit/UIKit.h>

@interface LogViewController : UIViewController
{
  IBOutlet UITextField *logEntry;
  IBOutlet NSMutableArray *logEntries;
}

@property(nonatomic, retain) UITextField *logEntry;
@property(nonatomic, readonly) NSArray *logEntries;

-(id) init;
-(IBAction) addLog;
-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField;
@end
