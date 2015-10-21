//
//  Site.swift
//  TheGrailDiary
//
//  Created by Isaiah Khan on 10/21/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Site
{
    var name: String
    var websiteType: String
    var websiteRank: String
    var country: String
    
    init(siteDictionary: NSDictionary)
    {
        name = siteDictionary["Name"] as! String
        websiteType = siteDictionary["Website type"] as! String
        websiteRank = siteDictionary["Website ranking"] as! String
        country = siteDictionary["Country"] as! String
        
    }
    

}
