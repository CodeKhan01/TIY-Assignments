//
//  Friend.swift
//  GitHubFriends
//
//  Created by Isaiah Khan on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    let name: String
    let email: String
    let username: String
    let followers: String
    
    init (name: String, email: String, username: String, followers: String)
    {
        self.name = name
        self.email = email
        self.username = username
        self.followers = followers
    }
    
    static func propertiesWithJSON(login: NSArray) -> [Friend]
    {
        var friends = [Friend]()
        
        if login.count > 0
        {
            for info in login
            {
                var name = info["name"] as? String
                var email = info["email"] as? String
                var username = info["login"] as? String
                var followers = info["followers"] as? String
            }
            
            friends.append(Friend(name: name, email: email, username: login, followers: followers))
        }
        return friends
    }
    
    
    
    
}