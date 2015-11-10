//
//  Ticket.h
//  JackPot_Obj_C
//
//  Created by Isaiah Khan on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (assign) BOOL winner;
@property (nonatomic) NSString *payout;
@property (nonatomic) NSMutableArray *picks;

+(instancetype)createQuickPick;


@end
