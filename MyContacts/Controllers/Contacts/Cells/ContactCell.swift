//
//  ContactCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    
    var contact:Contact!{
        didSet{
            
            if let imageUrl = contact.imageUrl{
                let placeHolder = UIImage(named: "User")
                imageView?.downloadedFrom(imageUrl, contentMode: .ScaleAspectFit, placeHolder: placeHolder!)
                
            }
            textLabel?.text = contact.name ?? "Unknown Name"
            detailTextLabel?.text = contact.position ?? "Unknown position"
            
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
