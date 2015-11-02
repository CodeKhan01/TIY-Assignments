//
//  ZipcodeViewController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ZipcodeViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var findCityLabel: UIButton!
    
    var delegate: ZipcodeViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        zipcodeTextField.becomeFirstResponder()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func validateZipCode(zipCode: String) -> Bool
    {
        var rc = false
        
        //let characterSet = NSCharacterSet(charactersInString: "0123456789")
        if zipcodeTextField.text != "" && zipcodeTextField.text!.characters.count == 5
        {
            rc = true
        }
        else
        {
            zipcodeTextField.text = ""
            zipcodeTextField.placeholder = "Enter ZipCode"
        }
        return rc

    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipcodeTextField.text != nil && validateZipCode(zipcodeTextField.text!)
        {
            rc = true
            search(zipcodeTextField.text!)
        }
        
        return rc
    }
    
    
    //MARK: Action Handlers
    @IBAction func findCity(sender: AnyObject)
    {
        if zipcodeTextField.text != nil && validateZipCode(zipcodeTextField.text!)
        {
            search(zipcodeTextField.text!)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func search(zip: String)
    {
        delegate!.zipWasChosen(zip)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
