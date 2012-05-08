#import "LogRunController.h"
#import "OCDSpec/OCDSpec.h"

@interface TestUITextField : UITextField
{
  BOOL isFirstResponder;
}
@end

@implementation TestUITextField

-(id) init
{
  if ((self = [super init]))
  {
    [self resignFirstResponder];
  }
  return self;
}

-(BOOL) becomeFirstResponder
{
  isFirstResponder = YES;
  return YES;
}

-(BOOL) isFirstResponder
{
  return isFirstResponder;
}

-(BOOL) resignFirstResponder
{
  isFirstResponder = NO;
  return YES;
}
@end

CONTEXT(LogRunController) {
  __block LogRunController *cont;

  describe(@"storeLogEntry",

          beforeEach(^{
            cont = [[LogRunController alloc] init];
            cont.logEntry = [[TestUITextField alloc] init];
            [cont viewDidLoad];
          }),

          it(@"stores the log entry, for later viewing", ^{
            cont.logEntry.text = @"logStuff";

            [cont addLog];

            [expect([NSNumber numberWithInt:[cont tableView: nil numberOfRowsInSection:0]]) toBeEqualTo:[NSNumber numberWithInt:1]];
          }),

          it(@"returns the default table view cell with the right log entry", ^{
            cont.logEntry.text = @"logOne";
            [cont addLog];
            cont.logEntry.text = @"logTwo";
            [cont addLog];

            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
            UITableViewCell *cell = [cont tableView: nil cellForRowAtIndexPath: indexPath];

            [expect(cell.textLabel.text) toBeEqualTo:@"logTwo"];
          }),

          it(@"closes the keypad", ^{
            [cont.logEntry becomeFirstResponder];

            [cont textFieldShouldReturn:cont.logEntry];

            expectFalse([cont.logEntry isFirstResponder]);
          }),

          nil); // Don't forget the terminating nil
}

