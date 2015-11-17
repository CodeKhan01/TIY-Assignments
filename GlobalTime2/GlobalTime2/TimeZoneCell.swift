//
//  TimeZoneCell.swift
//  GlobalTime2
//
//  Created by Isaiah Khan on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeZoneCell: UITableViewCell
{
    @IBOutlet weak var citiesLabel: UILabel!
    @IBOutlet weak var clockView: ClockView!
    
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
