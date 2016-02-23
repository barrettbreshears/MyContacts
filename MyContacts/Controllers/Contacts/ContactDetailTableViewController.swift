//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit


class ContactDetailTableViewController: UITableViewController {

    var contact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        title = contact.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK - tableView delegates
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Contact Details"
        case 1:
            return "Address"
        case 2:
            return "Company"
        case 3:
            return "Email"
        default:
            return "Phone"
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ContactDetailsCell") as! ContactDetailsCell
            cell.contact = contact
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("AddressCell") as! AddressCell
            cell.contact = contact
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell") as! CompanyCell
            cell.contact = contact
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("EmailCell") as! EmailCell
            cell.row = indexPath.row
            cell.contact = contact
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("PhoneCell") as! PhoneCell
            cell.row = indexPath.row
            cell.contact = contact
            return cell
        }
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return contact.emails.count
        default:
            return contact.phones.count
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
}
