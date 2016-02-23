//
//  Contact.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class Contact {

    var imageUrl:String?
    var homePage:String?
    var name:String?
    var age:Int?
    var position:String?
    var emails = [Email]()
    var address:Address?
    var phones = [Phone]()
    var company:Company?
    
    
    init(json: NSDictionary) {
        
        if let imageUrl = json["imageUrl"] as? String {
            self.imageUrl = imageUrl
        }
        
        if let homePage = json["homePage"] as? String {
            self.homePage = homePage
        }
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
        if let age = json["age"] as? Int {
            self.age = age
        }
        
        if let position = json["position"] as? String {
            self.position = position
        }
        
        if let emails = json["emails"] as? [NSDictionary] {
            
            self.emails = Email.fromJSONArray(emails)
            
        }
        
        if let address = json["address"] as? NSArray {
            
            self.address = Address(json: address.firstObject! as! NSDictionary)
            
        }
        
        if let phones = json["phone"] as? [NSDictionary] {
            
            self.phones = Phone.fromJSONArray(phones)
            
        }

        
        if let company = json["companyDetails"] as? NSDictionary {
            
            self.company = Company(json: company)
            
        }
        
        
        
    }
    
    
    class func fromJSONArray(json : [NSDictionary]) -> [Contact]{
        var contacts : [Contact] = [Contact]()
        for dictionary in json {
            contacts.append(Contact(json: dictionary))
        }
        return contacts
    }
}
