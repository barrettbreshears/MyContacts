//
//  MenuTableViewController.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logout(){
        // when the user hits the logout cell grab the window 
        // set the rootview as the login controller
        let window = UIApplication.sharedApplication().windows[0] as UIWindow
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginController = loginStoryboard.instantiateViewControllerWithIdentifier("LoginViewController")
        window.rootViewController = loginController

        
    }

}
