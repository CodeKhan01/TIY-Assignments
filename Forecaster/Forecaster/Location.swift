//
//  location.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

//NSCoding Constants
//let kCityKey = "city"
let kLatitudeKey = "lat"
let kLongitudeKey = "lng"


class Location: NSObject, NSCoding
{
    let city: String
    let lat: Double
    let lng: Double
    var weather: Weather?
    
    init(city: String, lat: Double, lng: Double, weather: Weather?)
    {
        self.city = city //city from init
        self.lat = lat // lat from init
        self.lng = lng //lng from init
        
        if weather != nil
        {
            self.weather = weather
        }
        else
        {
            self.weather = nil
        }
        
    }
    static func locationWithJSON(results: NSArray) -> Location
    {
        var city = ""
        var lat = 0.0
        var lng = 0.0
        var location: Location
        
        if results.count > 0
        {
            for result in results
            {
                let formattedAddress = result["formatted_address"] as? String
                city = formattedAddress!.componentsSeparatedByString(",")[0]
                
                let geometry = result["geometry"] as! NSDictionary
                    let location = geometry["location"] as! NSDictionary
                        lat = location["lat"] as! Double
                        lng = location["lng"] as! Double
        
            }
        }
        
        location = Location(city: city, lat: lat, lng: lng, weather: nil)
        return location
    }
    
    //MARK: - NSCoding
    //"Struct" do not work with NSCoding, only Classes
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let city = aDecoder.decodeObjectForKey(kCityKey) as? String
                    else { return nil }
        self.init(city: city,lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey),weather: nil)
        
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.city, forKey: kCityKey)
        aCoder.encodeObject(self.lat, forKey: kLatitudeKey)
        aCoder.encodeObject(self.lng, forKey: kLongitudeKey)
    }
    
}