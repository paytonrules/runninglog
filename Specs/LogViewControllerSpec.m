#import "LogViewController.h"
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

CONTEXT(LogViewController) {
  __block LogViewController *cont;

  describe(@"storeLogEntry",

          beforeEach(^{
            cont = [[LogViewController alloc] init];
            cont.logEntry = [[TestUITextField alloc] init];
          }),

          it(@"stores the log entry, for later viewing", ^{
            NSArray *logEntries = [NSArray arrayWithObject:@"logStuff"];
            cont.logEntry.text = @"logStuff";

            [cont addLog];

            [expect([NSNumber numberWithInt:[cont tableView: nil numberOfRowsInSection:0]]) toBeEqualTo:[NSNumber numberWithInt:1]];
          }),

          it(@"closes the keypad", ^{
            [cont.logEntry becomeFirstResponder];

            [cont textFieldShouldReturn:cont.logEntry];

            expectFalse([cont.logEntry isFirstResponder]);
          }),

          nil); // Don't forget the terminating nil
}

