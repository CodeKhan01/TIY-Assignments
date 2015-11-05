//
//  CityInfoCell.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CityInfoCell: UITableViewCell
{
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

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
