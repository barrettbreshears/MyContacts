//
//  Address.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class Address {

    var address1:String?
    var address2:String?
    var address3:String?
    var zipcode:Int?
    var country:String?
    var city:String?
    var state:String?

    init(json: NSDictionary) {
        
        if let address1 = json["address1"] as? String {
            self.address1 = address1
        }
        
        if let address2 = json["address2"] as? String {
            self.address2 = address2
        }
        
        if let address3 = json["address3"] as? String {
            self.address3 = address3
        }
        
        if let zipcode = json["zipcode"] as? Int {
            self.zipcode = zipcode
        }
        
        if let address2 = json["address2"] as? String {
            self.address2 = address2
        }
        
        if let country = json["country"] as? String {
            self.country = country
        }
        
        if let city = json["city"] as? String {
            self.city = city
        }
        
        if let state = json["state"] as? String {
            self.state = state
        }
        
    }
    
    class func fromJSONArray(json : [NSDictionary]) -> [Address]{
        var addresses : [Address] = [Address]()
        for dictionary in json {
            addresses.append(Address(json: dictionary))
        }
        return addresses
    }
    
}
