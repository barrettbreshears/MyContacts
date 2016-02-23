//
//  PhoneCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class PhoneCell: UITableViewCell {

    var row:Int!
    var contact:Contact!{
        didSet{
            textLabel?.text = contact.phones[row].number
            detailTextLabel?.text = contact.phones[row].type
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
