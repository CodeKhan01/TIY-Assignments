//
//  Ticket.m
//  JackPot_Obj_C
//
//  Created by Isaiah Khan on 11/10/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

@interface Ticket ()

+(instancetype)compareWithTicket:(NSMutableArray*) anotherTicket;

@end

@implementation Ticket

- (instancetype)init
{
    self = [super init];
    _picks = [[NSMutableArray alloc] init];
    _winner = NO;
    _payout = @"";
    return self;
}

+(instancetype)createQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    for (int x = 0;x < 6; x++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

-(void)createPick
{
    _Bool pickFound;
    
    pickFound = NO;
    do //may need break function if loop forever
    {
        NSInteger aPick = arc4random_uniform(53) + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInteger:aPick];
        if (![_picks containsObject:pickAsNumber])
        {
            
          [_picks addObject: pickAsNumber];
            pickFound = YES;
        }
    } while(!pickFound);
}

-(NSString*)description
{
    NSMutableString *numbers = [[NSMutableString alloc] init];
    
    for (NSNumber *pick in _picks)
    {
        [numbers appendString:[NSString stringWithFormat:@" %@ ", pick]];
    }
    return numbers;
}

//-(NSMutableArray*)PickArray
//{
//    NSMutableArray *picksArray;
//    
//    for (NSNumber *pick in _picks)
//    {
//        [picksArray addObject:[NSNumber numberWithInt:pick]];
//    }
//    return picksArray;
//}

//+(instancetype)compareWithTicket:(NSMutableArray*) anotherTicket
//{
//    NSMutableArray *anotherTicketPicks =[anotherTicket ];
//    int matchCount = 0;
//    
//    for aPossiblePick in
//}


@end
