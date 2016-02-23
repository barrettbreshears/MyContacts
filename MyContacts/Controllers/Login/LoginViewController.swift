//
//  LoginViewController.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emailTextFld:UITextField!
    @IBOutlet var passwordTextFld:UITextField!
    @IBOutlet var loginBtn:UIButton!
    @IBOutlet var textFieldView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        
    }
    
    func styleView(){
        
        textFieldView.layer.cornerRadius = 8
        textFieldView.clipsToBounds = true
        textFieldView.layer.borderColor = UIColor.lightGrayColor().CGColor
        textFieldView.layer.borderWidth = 1
        
        loginBtn.layer.cornerRadius = 8
        loginBtn.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logIn(){
        
        setLoginDefault()
        let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: nil)
        let contactsViewController = contactsStoryboard.instantiateViewControllerWithIdentifier("SWRevealViewController")
        
        presentViewController(contactsViewController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setLoginDefault(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "loggedIn")
    }

}
