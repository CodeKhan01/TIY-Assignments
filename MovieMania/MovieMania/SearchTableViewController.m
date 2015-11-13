//
//  SearchTableViewController.m
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "SearchTableViewController.h"
#import "MoviesCell.h"

@interface SearchTableViewController ()<UISearchBarDelegate,UISearchDisplayDelegate,UISearchResultsUpdating,UITableViewDataSource, NSURLSessionDataDelegate>

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search Movie";
    
    _moviesArray = [[NSMutableArray alloc] init];
    _shouldShowSearchResults = NO;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    [self.tableView registerClass:MoviesCell.self forCellReuseIdentifier:@"MoviesCell"];
    
    
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.searchBar.delegate = self;
    [_searchController.searchBar sizeToFit];
    [self.tableView.tableHeaderView copy:_searchController.searchBar];
    
    
    //[_searchController.searchResultsUpdater self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _moviesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoviesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoviesCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = _moviesArray[indexPath.row];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
#pragma mark - Search Bar Methods
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
}

-(void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
}


#pragma mark - NSURLSessionData delegate


-(void) omdbAPIRequest:(NSString * )searchTerm
{
    
    NSString * searchTermProcesed = [searchTerm stringByReplacingOccurrencesOfString:@" " withString: @"+"];

    
    NSString *urlString = [NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@",searchTermProcesed];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!_receivedData)
    {
        _receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [_receivedData appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful");
        _repos = [NSJSONSerialization JSONObjectWithData:_receivedData options:0 error:nil];
        [self.tableView reloadData];
    }
}



@end
