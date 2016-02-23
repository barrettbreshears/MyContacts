//
//  Email.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class Email {

    var email:String?
    var label:String?
    
    init(json: NSDictionary) {
        
        if let email = json["email"] as? String {
            self.email = email
        }
        
        if let label = json["label"] as? String {
            self.label = label
        }
        
    }
    
    class func fromJSONArray(json : [NSDictionary]) -> [Email]{
        var emails : [Email] = [Email]()
        for dictionary in json {
            emails.append(Email(json: dictionary))
        }
        return emails
    }

    
}
