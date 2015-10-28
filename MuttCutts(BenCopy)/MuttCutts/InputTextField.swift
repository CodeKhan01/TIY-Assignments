//
//  InputTextField.swift
//  MuttCutts
//
//  Created by Isaiah Khan on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class InputTextField
{
    //var delegate = InputTextFieldDelegate?
    
    func getLocation1(cityState1: String) -> Bool
    {
        if cityState1.characters.count > 0
        {
            return true
        }
        else
        {
            return false
        }
    }
    func getLocation2(cityState2: String) -> Bool
    {
        if cityState2.characters.count > 0
        {
            return true
        }
        else
        {
            return false
        }
    }

}
