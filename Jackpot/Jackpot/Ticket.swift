//
//  Ticket.swift
//  Jackpot
//
//  Created by Isaiah Khan on 10/14/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Ticket
{
    var ticketPicks = Array<Int>()
    init ()
    {
        for _ in 1...6
        {
            // call your function here
        }
    }
    
    func createAndAddNumber()
    {
        var pickFound = false
        repeat
        {
            let aPick = Int(arc4random() % 53 + 1)
            if !ticketPicks.contains(aPick)
            {
                ticketPicks.append(aPick)
            pickFound = true
            }
        }
            while !pickFound
    }
    
}
