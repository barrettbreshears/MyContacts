//
//  AppDelegate.swift
//  MyContacts
//
//  Created by Barrett Breshears on 2/20/16.
//  Copyright © 2016 sledgedev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        styleApp()
        setUpWindow()
        
        
        return true
    }
    
    // sets the apps view based on if the user is logged in or not
    func setUpWindow(){
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let loggedIn = defaults.boolForKey("loggedIn")
        
        if !loggedIn {
            let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let loginController = loginStoryboard.instantiateViewControllerWithIdentifier("LoginViewController")
            window?.rootViewController = loginController

        }else{
            let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: nil)
            let contactsViewController = contactsStoryboard.instantiateViewControllerWithIdentifier("SWRevealViewController")
            window?.rootViewController = contactsViewController
        }
        
        window?.makeKeyAndVisible()
    }
    
    
    // set default styles for the navigation bar
    func styleApp(){
        UIBarButtonItem.appearance().setTitleTextAttributes([ NSForegroundColorAttributeName : UIColor.myContactsYellow(), NSFontAttributeName:UIFont.appFont()], forState: .Normal)
        
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        UINavigationBar.appearance().titleTextAttributes = [ NSForegroundColorAttributeName : UIColor.myContactsYellow(), NSFontAttributeName:UIFont.appFont()]
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

