//
//  TicketsTableViewController.h
//  JackPot_Obj_C
//
//  Created by Isaiah Khan on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WinningTicketProtocol

//-(void)winningTicketWasAdded:(Ticket *)ticket;

@end




@interface TicketsTableViewController : UITableViewController <WinningTicketProtocol>

@end
