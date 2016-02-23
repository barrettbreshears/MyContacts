//
//  ContactsProvider.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit
import Alamofire

class ContactsProvider {

    class func getContacts(completionHandler:([Contact], NSError?) -> (Void)){
        
        Alamofire.request(.GET, APICalls.getContacts , parameters:nil )
            .response { request, response, data, error in
                // make sure there aren't any erros
                if error != nil {
                    completionHandler([], error)
                    return
                }
                
                // check to see if there is any data
                guard let jsonData = data else{
                    let userInfo: [NSObject : AnyObject] =
                    [
                        NSLocalizedDescriptionKey :  NSLocalizedString("Bad Data", value: "Bad data unable to parse json data", comment: "")
                    ]
                    let err = NSError(domain: "ShiploopHttpResponseErrorDomain", code: 401, userInfo: userInfo)
                    completionHandler([], err)
                    return
                }
                
                // grab the json and parse it into contacts models
                let json = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
                let contacts = Contact.fromJSONArray(json as! [NSDictionary])
                completionHandler(contacts, nil)
                
        }
    
    }
    
}
