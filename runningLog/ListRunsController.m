#import "ListRunsController.h"

@interface ListRunsController ()

@end

@implementation ListRunsController

-(id) initWithNibName:(NSString *)nibNameOrNil interactor:(NSObject<LogRunInteractor> *)newInteractor
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nil]))
    {
        interactor = newInteractor;
    }
    return self;
}

// Kinda hate generated code. 
// Okay don't "kinda"
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return interactor.logEntries;
}
 
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LogEntry"];
    NSString *logEntry = [interactor getLogAt:indexPath.row - 1];
    cell.textLabel.text = logEntry;

    return cell;
}

@end
