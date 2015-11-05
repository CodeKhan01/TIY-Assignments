//
//  Weather.swift
//  Forecaster
//
//  Created by Isaiah Khan on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Weather
{
    let summary: String
    let temperature: Double
    
    init (summary: String, temperature:Double)
    {
        self.summary = summary
        self.temperature = temperature
    }
    
    
    static func weatherWithJSON(currently: NSDictionary) -> Weather
    {
        var summary = ""
        var temperature = 0.0
        
        summary = currently["summary"] as! String
        temperature = currently["temperature"] as! Double
        
        let weather = Weather(summary: summary, temperature: temperature)
        return weather
    }
    
    
}