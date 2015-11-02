//
//  APIController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    
    //var delegate: APIController
    
    
    
    
    
    func useZipForCity (zipCode: String)
    {
        let urlPath = "http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(zipCode)&sensor=false"
        let url = NSURL(string: urlPath)//Creates URL object and stores it in a constant called url.
        let session = NSURLSession.sharedSession()
        //NSURLSession is a class referenece and has related classes associated with it that allows people to download content from the internet. 
        //sharedSession() - Another class method(function) that returns a basic url request from the internet.
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            //dataTaskWithURL is a completion handler function that checks your request to whatever url your trying to connect to.
            
            if error != nil //nil means absent or no-value types
//This if statement says that if there is an error that isnt equal to nothing then print all the errors that are going on with your request to the web.
            {
                print(error!.localizedDescription)
            }
            else //if there is no errors then
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let results : NSArray = dictionary["results"] as? NSArray
                    {
                        self.delegate.didReceiveAPIResults(results)
                    }
                }
            }
        })
        task.resume() 
    }
    
    func parseJSON(data:NSData)
    {
        
    }
        
}
