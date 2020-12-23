//
//  SignUpUser.swift
//  WhyKnottCoffee
//
//  Created by Ian Knott on 3/3/20.
//  Copyright © 2020 Ian Knott. All rights reserved.
//

import Foundation
import TextFieldEffects
import UIKit
import Firebase
import LGButton


public class SignUpUser: UIViewController{
    
    
    
    
    
    
    @IBOutlet weak var emailSignUpField: HoshiTextField!
    
    
    @IBOutlet weak var passwordSignUpField: HoshiTextField!
    
    
    
    @IBAction func signUpButtonPressed(_ sender: LGButton) {
        
     sender.isLoading = true
                          let deadlineTime = DispatchTime.now() + .seconds(3)
                          DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                              sender.isLoading = false
                   }
                   
                   Auth.auth().createUser(withEmail: emailSignUpField.text!, password: passwordSignUpField.text!){
                             (result,error)in
                            
                             //tests to see if there is an error
                       if error != nil  {
                                 print(error!)
                             }else{
                        
                        //writes data to firestore
                              let collection = Firestore.firestore().collection("user")
                        
                        
                        // sets the values for our users struct
                        
                        let user = Users(email: self.emailSignUpField.text!, beans: 2, totalRewardCards: 0)
                        
                        collection.addDocument(data: user.dictionary)
                        
                        
                        
                self.performSegue(withIdentifier: "registeredToday", sender: self)
                                             
                             
                                 
                       
                       }

          
              }
        
        
    }
    
}
