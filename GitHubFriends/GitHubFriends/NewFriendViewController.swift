//
//  ViewController.swift
//  GitHubFriends
//
//  Created by Isaiah Khan on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(embryoconcepts: NSDictionary)
}

class NewFriendViewController: UIViewController, APIControllerProtocol
{
    var api: APIController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        api = APIController(delegate: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: API Controller Protocol
    func didReceiveAPIResults(embryoconcepts: NSDictionary)
    {
        <#code#>
    }
    

}

