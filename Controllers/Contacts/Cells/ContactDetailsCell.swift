//
//  ContactDetailsCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class ContactDetailsCell: UITableViewCell {
    
    
    @IBOutlet var contactImage:UIImageView!
    @IBOutlet var name:UILabel!
    @IBOutlet var age:UILabel!
    @IBOutlet var position:UILabel!
    @IBOutlet var homePage:UILabel!
    
    var contact:Contact!{
        didSet{
            
            if contact.imageUrl != nil {
                contactImage.downloadedFrom(contact.imageUrl!, contentMode:.ScaleAspectFit, placeHolder: UIImage(named: "User")!)
            }
            
            name.text = contact.name
            
            age.text = "age: " + ( contact.age != nil ? String(contact.age!) : "unknown" )
            position.text = contact.position
            homePage.text = contact.homePage
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
