//
//  ColorExtension.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

extension UIColor{
    
    public class func myContactsYellow() -> UIColor {
        return UIColor.colorFromRGB(red: 254, green: 212, blue: 54)
    }
    
    public class func colorFromRGB(red red:UInt, green: UInt, blue:UInt) -> UIColor {
        return UIColor(red: (CGFloat(red)/255.0), green: (CGFloat(green)/255.0), blue: (CGFloat(blue)/255), alpha: 1)
    }
    
}