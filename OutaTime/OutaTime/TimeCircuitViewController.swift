//
//  ViewController.swift
//  OutaTime
//
//  Created by Isaiah Khan on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate //

class TimeCircuitViewController: UIViewController
{
    @IBOutlet weak var setDestinationTime: UIButton!
    @IBOutlet weak var travelBack: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mphLabel: UILabel!
    
    var timer: NSTimer? // get the timer going
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

/* 1. Click set destination time.
    2. Pick your date
    3. Delegate the date chosen back to the label on the main controller
    3. click on back button - create function to what happends when you go back to the main view controller.
    4. create a function to get the timer going. 
    5. another function to update the speed label
        - if currentSpeed is not != 88, run this code, else stop the timer and set the current speed to zero.
*/