//
//  ToDoListCell.swift
//  InDueTime
//
//  Created by Isaiah Khan on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoListCell: UITableViewCell
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var checkedButton: UIButton!
    
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
