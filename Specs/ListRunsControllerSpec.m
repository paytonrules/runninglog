#import "OCDSpec/OCDSpec.h"
#import "ListRunsController.h"
#import "FakeLogRunInteractor.h"
 
CONTEXT(ListRunsController)
{
    describe(@"listing the runs",
              it(@"returns the default table view cell with the right log entry", 
                 ^{
                     FakeLogRunInteractor *interactor = [[FakeLogRunInteractor alloc] init];
                     [interactor log:@"Log One"];
                     ListRunsController *cont = [[ListRunsController alloc] initWithNibName:nil interactor: interactor];
                     
                     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
                     UITableViewCell *cell = [cont tableView: nil cellForRowAtIndexPath: indexPath];
                     
                     [expect(cell.textLabel.text) toBeEqualTo:@"Log One"];
              }),
             
              it(@"returns the count of the entries in the log",
                 ^{
                     FakeLogRunInteractor *interactor = [[FakeLogRunInteractor alloc] init];
                     [interactor log:@"Log One"];
                     [interactor log:@"Log Two"];
                     
                     ListRunsController *cont = [[ListRunsController alloc] initWithNibName:nil interactor: interactor];
                     
                     [expect([NSNumber numberWithInt:[cont tableView:nil numberOfRowsInSection:0]]) 
                            toBeEqualTo:[NSNumber numberWithInt:2]];
                 }),
              
              nil); // Don't forget the terminating nil
}