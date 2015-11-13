//
//  SearchTableViewController.h
//  MovieMania
//
//  Created by Isaiah Khan on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *moviesArray;
//@property (weak, nonatomic) APIController *apiController;
//@property (nonatomic, weak) id <SearchTableViewProtocol>delegator;
@property (nonatomic) BOOL shouldShowSearchResults;
@property (nonatomic) UISearchController *searchController;

@property (nonatomic)  NSArray * repos;
@property (nonatomic)  NSMutableData *receivedData;

@property (nonatomic)  UITableView *theTableView;

@end