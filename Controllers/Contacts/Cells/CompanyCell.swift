//
//  CompanyCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {

    var contact:Contact!{
        didSet{
            textLabel?.text = contact.company?.name
            detailTextLabel?.text = contact.company?.location
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
