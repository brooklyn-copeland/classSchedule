//
//  BNRMasterViewController.m
//  Class Schedules
//
//  Created by Brooklyn Copeland on 4/29/14.
//  Copyright (c) 2014 Brooklyn Copeland. All rights reserved.
//

#import "BNRMasterViewController.h"

#import "BNRDetailViewController.h"
#import "BNRAddClassViewController.h"

#import "BNRClass.h"

@interface BNRMasterViewController () {
    NSMutableArray *_objects;
}
@property (nonatomic, strong) NSMutableArray *classes;

@end

@implementation BNRMasterViewController

- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    [self.tableView reloadData];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    // unwind segue
    NSLog(@"Segue unwound");
    
    BNRAddClassViewController *addViewController = segue.sourceViewController;
    
    // get the data
    NSString *newClassName= addViewController.inputClassName.text;
    
    NSString *newClassBlock= addViewController.inputClassBlock.text;
    
    // create a new class object
    BNRClass *class = [[BNRClass alloc] initWithName:newClassName andBlock:newClassBlock];
    // add it to the class array
    [self.classes addObject:class];
    
    
    
    [self.tableView reloadData];
}
- (NSMutableArray *)students
{
    if (_classes == nil) _classes = [[NSMutableArray alloc] init];
    return _classes;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BNRClass *object = _classes[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BNRClass *object = self.classes[indexPath.row];
        
        BNRDetailViewController *dvc = (BNRDetailViewController *)[segue destinationViewController];
        NSLog(@"%@",dvc);
        [dvc setDetailItem:object];
        
    }}

@end
