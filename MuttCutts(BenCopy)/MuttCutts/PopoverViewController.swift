//
//  PopoverViewController.swift
//  MuttCutts
//
//  Created by Isaiah Khan on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var cS1TF: UITextField!//City State 1 TextField
    @IBOutlet weak var cS2TF: UITextField!//City State 2 TextField
    
    var delegate: PopoverViewControllerDelegate?
    
    let inputTextField = InputTextField()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField.text != ""
        {
            switch textField
            {
            case cS1TF:
                cS2TF.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return true
    }

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Action Handlers
    
    @IBAction func searchButton(sender: AnyObject)
    {
        if cS1TF.text != "" && cS2TF.text != ""
        {
            delegate?.citiesWereFound([cS1TF.text!, cS2TF.text!])
        }
    }
    

}
