//
//  ViewController.swift
//  WhyKnottCoffee
//
//  Created by Ian Knott on 2/29/20.
//  Copyright © 2020 Ian Knott. All rights reserved.
//

import UIKit
import Firebase
import SwiftIconFont
import LGButton
import TextFieldEffects
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLoginTextField: HoshiTextField!
    
    @IBOutlet weak var passwordLoginTextField: HoshiTextField!
    
    
    @IBAction func loginButtonPressed(_ sender: LGButton) {
        
        sender.isLoading = true
                                 let deadlineTime = DispatchTime.now() + .seconds(3)
                                 DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                                     sender.isLoading = false
                          }
                          
        
        
        Auth.auth().signIn(withEmail: emailLoginTextField.text!, password: passwordLoginTextField.text!){(result, error)in
        
        if error != nil {
            print(error!)
        }else{
            print("Log in successful")
            
          
            self.performSegue(withIdentifier: "loginPressedToFeed", sender: self)
              let currentUser = result!.user.uid
        }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        // Observe access token changes
        // This will trigger after successfully login / logout
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            // Print out access token
            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
        }
        // this will close the text entry when you tap on the screen.
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
               view.addGestureRecognizer(tap)
        
        
    }


}

