//
//  APIController.swift
//  GitHubFriends
//
//  Created by Isaiah Khan on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate 
    }
    
    func searchGitHubFor(userName: String)
    {
        if let escapedSearchTerm = userName.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.alphanumericCharacterSet())
        {
            let url = NSURL(string: "https://api.github.com/users/embryoconcepts")
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = self.parseJSON(data!)
                    {
                        if let gitHubUser: NSDictionary = dictionary["embryoconcepts"] as? NSDictionary
                        {
                            self.delegate.didReceiveAPIResults(embryoconcepts)
                        }
                    }
                }
            })
            task.resume()
        }
    }
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
    
    
    
    
    
    
}