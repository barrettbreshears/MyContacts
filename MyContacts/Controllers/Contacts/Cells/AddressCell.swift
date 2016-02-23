//
//  AddressCell.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/21/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet var address:UILabel!
    @IBOutlet var cityStateZip:UILabel!
    
    var contact:Contact!{
        didSet{
            
            let address1 = contact.address?.address1 ?? ""
            let address2 = contact.address?.address2 ?? ""
            let address3 = contact.address?.address3 ?? ""
            address.text = "\(address1), \(address2) \(address3)"
            
            let city = contact.address?.city ?? ""
            let state = contact.address?.state ?? ""
            let zip = contact.address?.zipcode != nil ? String(contact.address!.zipcode!) : ""
            let country = contact.address?.country ?? ""
            cityStateZip.text = "\(city), \(state) \(zip) \(country)"
            
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
