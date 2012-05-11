#import "LogRunController.h"

@interface LogRunController ()

@end

@implementation LogRunController   
@synthesize logEntry;

-(id) initWithNibName:(NSString *)nibNameOrNil andInteractor:(NSObject<LogRunInteractor> *)newInteractor
{
    interactor = newInteractor;
    return [self initWithNibName:nibNameOrNil bundle:nil];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
  {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  }
  else
  {
    return YES;
  }
}

-(IBAction) addLog
{
  [interactor log:logEntry.text];
}

-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField
{
  [logEntryField resignFirstResponder];
  return YES;
}


@end
