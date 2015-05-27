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
            }
            else if user!.isNew {
                println("User signed up and logged in through Facebook!")
            }
            else {
                println("User logged in through Facebook!")
            }
        })
    }
}
