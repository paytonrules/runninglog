#import "LogViewController.h"

@interface LogViewController ()

@end

@implementation LogViewController
@synthesize logEntry, logEntries;

-(id) init
{
  if (self = [super init])
  {
    logEntries = [NSMutableArray array];
  }

  return self;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
  {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else
  {
    return YES;
  }
}

-(IBAction) addLog
{
  [logEntries addObject:logEntry.text];
}

-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField
{
  [logEntryField resignFirstResponder];
  return YES;
}


@end
