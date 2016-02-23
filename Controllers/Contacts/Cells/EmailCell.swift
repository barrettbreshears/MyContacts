//
//  EmailCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {

    var row:Int!
    var contact:Contact!{
        didSet{
            textLabel?.text = contact.emails[row].email
            detailTextLabel?.text = contact.emails[row].label
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
