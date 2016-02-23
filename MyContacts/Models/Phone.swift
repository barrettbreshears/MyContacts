//
//  Phone.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class Phone {

    var number:String?
    var type:String?
    
    init(json: NSDictionary) {
        
        if let number = json["number"] as? String {
            self.number = number
        }
        
        if let type = json["type"] as? String {
            self.type = type
        }
    }
    
    class func fromJSONArray(json : [NSDictionary]) -> [Phone]{
        var phones : [Phone] = [Phone]()
        for dictionary in json {
            phones.append(Phone(json: dictionary))
        }
        return phones
    }
}
