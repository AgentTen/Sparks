//
//  LoginViewController.swift
//  Sparks
//
//  Created by Ryan Farley on 5/27/15.
//  Copyright (c) 2015 ryanfarley. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressFBLogin(sender: UIButton) {
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile", "user_about_me", "user_birthday"], block: { (user, error) -> Void in
            if user == nil {
                println("Uh oh. The user cancelled the Facebook Login.")
                // Add UIAlertController before pushing to app store
                return
            }
            else if user!.isNew {
                println("User signed up and logged in through Facebook!")
                
                FBSDKGraphRequest(graphPath: "/me?fields=picture,first_name,birthday,gender", parameters: nil).startWithCompletionHandler({ (connection, result, error) -> Void in
                    
                    if error == nil {
                        var r = result as! NSDictionary
                        user!["firstName"] = r["first_name"]
                        user!["gender"] = r["gender"]
                        user!["picture"] = ((r["picture"] as! NSDictionary)["data"] as! NSDictionary) ["url"]
                        var dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "MM/dd/yyyy"
                        user!["birthday"] = dateFormatter.dateFromString(r["birthday"]as! String)
                        
                        user!.saveInBackgroundWithBlock({ success, error in
                            println(success)
                            println(error)
                        })
                    }
                })
            }
            else {
                println("User logged in through Facebook!")
            }
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CardsNavController") as? UIViewController
            self.presentViewController(vc!, animated: true, completion: nil)
        })
    }
}
