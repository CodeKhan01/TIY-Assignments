//
//  TicketsTableViewController.m
//  JackPot_Obj_C
//
//  Created by Isaiah Khan on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "Ticket.h"
#import "TicketCell.h"

@interface TicketsTableViewController () 
{
    NSMutableArray *tickets;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;




@end

@implementation TicketsTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    tickets = [[NSMutableArray alloc]init];
    //[self loadtickets];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete implementation, return the number of rows
    return tickets.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TicketCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    
    NSString *aTicket = tickets[indexPath.row];
    cell.numbersLabel.text = [aTicket description];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Winning Ticket Delegate

-(void)winningTicketWasAdded:(Ticket *)ticket;
{
    
}

- (IBAction)createTicket:(id)sender
{
    Ticket *aTicket = [Ticket createQuickPick];
    [tickets addObject:aTicket];
    [self.tableView reloadData];
}


@end
