//
//  Ticket.m
//  JackPot_Obj_C
//
//  Created by Isaiah Khan on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@interface Ticket ()


@end

@implementation Ticket

- (instancetype)init
{
    self = [super init];
    _picks = [[NSArray alloc] init];
    _winner = NO;
    _payout = @"";
    return self;
}

-(void)createQuickPick
{
    _winner = NO;
    _payout = @"";
    
    for (int x = 0;x < 6; x++)
    {
        [self createPick];
    }
}

-(void)createPick
{
    _Bool pickFound;
    
    pickFound = NO;
    {
        NSInteger aPick = arc4random_uniform(53) + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInteger:aPick];
        if (![_picks containsObject:pickAsNumber])
        {
            
        }
    }
}

@end
