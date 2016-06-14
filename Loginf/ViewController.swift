//
//  ViewController.swift
//  Loginf
//
//  Created by Sandyz on 6/7/16.
//  Copyright (c) 2016 Education. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController , FBSDKLoginButtonDelegate {

    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = self.view.center
        
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.currentAccessToken(){
            fetchProfile()
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func fetchProfile(){
        print("fetch the Profile")
        
        let parameters = ["fields": "email,first_name,last_name, picture.type(large)"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler {
            (connection,result, error)-> Void in
            
            
            if error != nil {
                print(error)
                return
            }
            
            if let email = result["email"] as? String {
                print(email)
            
            }
            if let picture = result["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary,url = data["url"] as? String{
                print(url)
            }
            
        }
        
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("completed login")
        print("fetch the Profile")
        
        
    
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        
    }

    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

