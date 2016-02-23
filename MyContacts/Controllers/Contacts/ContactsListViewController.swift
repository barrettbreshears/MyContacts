//
//  ContactsListViewController.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit
import SWRevealViewController


class ContactsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var revealController:SWRevealViewController!
    var contacts = [Contact]()
    var selectedContact:Contact?
    var searchContacts:[Contact]?
    @IBOutlet var revealButtonItem:UIBarButtonItem!
    @IBOutlet var tableView:UITableView!
    @IBOutlet var searchBar:UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "contacts"
        revealButtonItem.target = self.revealViewController()
        revealButtonItem.action = "revealToggle:"
        
        searchBar.delegate = self
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // get contacts when the view appears
        ContactsProvider.getContacts {[weak self] ( contacts , error ) -> (Void) in
            
            if self == nil {
                return
            }
            
            // check for error from network call
            if error != nil {
                self?.showError(error!.localizedDescription)
            }
            
            // set contacts and reload tableView
            self!.contacts = contacts
            self!.tableView.reloadData()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchContacts != nil ? searchContacts!.count : contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactCell
        let tableContacts = searchContacts != nil ? searchContacts! : contacts
        let contact = tableContacts[indexPath.row]
        cell.contact = contact
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedContact = searchContacts != nil ? searchContacts![indexPath.row] : contacts[indexPath.row]
        performSegueWithIdentifier("goToDetail", sender: self)
    }
    
    
    // MARK: - UISearchBarDelegate
    // filter results when the user starts to type
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchContacts = nil
        }else{
            // filter contacts
            searchContacts = contacts.filter({
                // make sure contact has a name value
                if let _ = $0.name {
                    return $0.name!.containsString(searchText)
                }else{
                    return false
                }
            })
        }
        
        tableView.reloadData()
        
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    // when the user hits cancel clear the search contacts and reload data
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchContacts = nil
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    // MARK: - view controller helper methods
    func showError(error:String){
        let errorAlert = UIAlertController(title:nil, message: error, preferredStyle: .Alert)
        let errorAction = UIAlertAction(title: "OK", style: .Default, handler: nil )
        errorAlert.addAction(errorAction)
        presentViewController(errorAlert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // when the user selects the cell and the new controller is load we need to set the contact
        let controller = segue.destinationViewController as! ContactDetailTableViewController
        controller.contact = selectedContact
        
    }
}
