//
//  UIImageViewExtension.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

extension UIImageView {
    
    // async image download extension
    func downloadedFrom(link:String, contentMode mode: UIViewContentMode, placeHolder:UIImage) {
        guard
            let url = NSURL(string: link)
            else {return}
        contentMode = mode
        image = placeHolder
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
                self.layer.cornerRadius = self.frame.height / 2
                self.clipsToBounds = true
            }
        }).resume()
    }
    
}