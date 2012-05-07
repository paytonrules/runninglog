#import "LogViewController.h"

@interface LogViewController ()

@end

@implementation LogViewController   
@synthesize logEntry;

-(void) viewDidLoad
{
  logEntries = [NSMutableArray array];
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
  [logEntries addObject:logEntry.text];
}

-(BOOL) textFieldShouldReturn:(UITextField *)logEntryField
{
  [logEntryField resignFirstResponder];
  return YES;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return logEntries.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LogEntry"];
  cell.textLabel.text = [logEntries objectAtIndex:indexPath.row];
  return cell;
}


@end
