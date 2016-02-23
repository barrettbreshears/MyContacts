//
//  Company.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class Company {

    var location:String?
    var name:String?
    
    init(json: NSDictionary) {
        
        if let location = json["location"] as? String {
            self.location = location
        }
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
    }
}
