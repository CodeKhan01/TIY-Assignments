//
//  DarkSkyAPIController.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class DarkSkyAPIController
{
    var delegate: DarkSkyAPIControllerDelegate
    
    init(delegate: DarkSkyAPIControllerDelegate)
    {
        self.delegate = delegate
    }
    
    func useCityForWeather(location: Location)
    {
        let searchedForLocation = location
        
        print("useCityForWeather")
        
        let lat = location.lat
        let lng = location.lng
        
        let urlPath = "https://api.forecast.io/forecast/c36329b954496bf70181c3fae95553b8/\(lat),\(lng)"
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
                    // its a dictionary because it starts with a curly bracket, which means the data is a dictionary in JSON.
                {
                    if let dictCurrently: NSDictionary = dictionary["currently"] as? NSDictionary
                    {
                        self.delegate.didReceiveDarkSkyAPIResults(dictCurrently, searchedForLocation: searchedForLocation)
                    }// end of if let arrayResults statement.
                }//end of if let dictionary statement.
            }//end of if error is nil statement.
        }) //ends the dataTasksWithURL
        
        task.resume()//takes dataTaskWithURL, checks the whole argument, and runs it after it checks all the data.
    }
    //parseJSON takes an NSData object and returns it into a NSDictionary.? - means optional - returns an actual dictionary of data or nil.
    func parseJSON(data:NSData)-> NSDictionary?
    {
        do //means try and do this. If it works then it runs whatever is in the first backet. If it doesnt work, then it will go to "catch" and check for errors.
        {
            //try means to actually run NSJSONSerialization.
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            //JSONObjectWithData(data, - means we have a bucket of data from the url path and convert it to JSON. If it starts with a curly brace than its a JSON Dictionary. If it starts with a bracket then it is an array, that lists dictionaries.
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
    
}


