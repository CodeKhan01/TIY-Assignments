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
    func didReceiveAPIResults(login: NSArray)
}

class NewFriendViewController: UIViewController, APIControllerProtocol
{
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    var api: APIController!
    var friends = [Friend]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        api = APIController(delegate: self)
        api.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: API Controller Protocol
    func didReceiveAPIResults(login: NSArray)
    {
        friends = Friend.propertiesWithJSON(login)
    }
    

}

