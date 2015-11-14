//
//  MovieManiaTableViewController.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MovieManiaTableViewController.h"
#import "MoviesCell.h"
#import "SearchTableViewController.h"
#import "DetailTableViewController.h"


@interface MovieManiaTableViewController ()

@end

@implementation MovieManiaTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Movie Mania";
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorColor = [UIColor clearColor];

    
    _moviesArray = [[NSMutableArray alloc]init];
    _moviesRegisterArray = [[NSMutableArray alloc] init];
    _rightAddButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(addButtonActionTapped:)];
    _moviesForSearch = [NSString stringWithFormat:@""];
    
    //[self.navigationItem setRightBarButtonItems:@[_rightAddButton] animated:YES];

    
     self.navigationItem.rightBarButtonItem = _rightAddButton;
    
    [self.tableView registerClass:MoviesCell.self forCellReuseIdentifier:@"MoviesCell"];
    
    
    //test
    //[_moviesArray addObject:@"hola mundo"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _moviesArray.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoviesCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_moviesArray[indexPath.row] title];
    
    [cell loadImage:[_moviesArray[indexPath.row] poster]];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewController *detailTableVC = [[DetailTableViewController alloc]init];
    
    detailTableVC.movie = _moviesArray[indexPath.row];
    
    [self.navigationController pushViewController:detailTableVC animated:YES];
    
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

#pragma mark - Handle Actions
-(void)addButtonActionTapped:(UIButton *)sender
{
    SearchTableViewController *searchTableVC = [[SearchTableViewController alloc]init];
    UINavigationController *navigationConroller = [[UINavigationController alloc]initWithRootViewController:searchTableVC];
    searchTableVC.delegator = self;
    searchTableVC.view.backgroundColor = [UIColor blackColor];
    searchTableVC.tableView.separatorColor = [UIColor clearColor];
    [self presentViewController:navigationConroller animated:YES completion:nil];
    
}

#pragma mark - Search Table Protocol
-(void)movieWasFound:(Movie *)aMovie
{
    [_moviesArray addObject:aMovie];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}


@end
