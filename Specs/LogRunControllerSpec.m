#import "OCDSpec/OCDSpec.h"
#import "LogRunController.h"
#import "FakeLogRunInteractor.h"

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
  __block FakeLogRunInteractor *interactor;

  describe(@"storeLogEntry",

          beforeEach(^{
            interactor = [[FakeLogRunInteractor alloc] init];
            cont = [[LogRunController alloc] initWithNibName:@"" andInteractor: interactor];
            cont.logEntry = [[TestUITextField alloc] init];
            [cont viewDidLoad];
          }),

          it(@"stores the log entry, for later viewing", ^{
            cont.logEntry.text = @"logStuff";

            [cont addLog];
      
            [expect([interactor.logs objectAtIndex:0]) toBeEqualTo:@"logStuff"];
          }),

          it(@"closes the keypad", ^{
            [cont.logEntry becomeFirstResponder];

            [cont textFieldShouldReturn:cont.logEntry];

            expectFalse([cont.logEntry isFirstResponder]);
          }),
           
           it(@"returns YES from the textFieldShouldReturn", 
              ^{
                  expectTruth([cont textFieldShouldReturn:cont.logEntry]);
              }),

          nil); // Don't forget the terminating nil
}

