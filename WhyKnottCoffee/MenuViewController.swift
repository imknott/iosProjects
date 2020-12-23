//
//  MenuViewController.swift
//  WhyKnottCoffee
//
//  Created by Ian Knott on 3/5/20.
//  Copyright © 2020 Ian Knott. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import LGButton
import SwiftIconFont

public class MenuViewController: UIViewController{
    
    var customerOrderTotal: Double = 0.00
    var totalCostOfPastry : Double = 0.00
    var totalCostOfCold: Double = 0.00
    var totalCostOfFrench: Double = 0.00
    var totalCostOfTea:Double = 0.00
    var totalCostOfDrip:Double = 0.00
    
    
    @IBOutlet weak var dripCoffeeOrderTotal: UITextField!
    
    
    @IBOutlet weak var hotTeaOrderTotal: UITextField!
    
    
    @IBOutlet weak var frenchPressOrderTotal: UITextField!
    
    @IBOutlet weak var coldBrewOrderTotal: UITextField!
    
    @IBOutlet weak var pastryOrderTotal: UITextField!
    
    
    @IBAction func orderNowPressed(_ sender: LGButton) {
        
        // I am setting all the textfields text to a int so I can then multiply them by the total cost of the item and then add up all the values at the end.
        
        if let dripCoffeeTotal = Double(dripCoffeeOrderTotal.text!){
           totalCostOfDrip = dripCoffeeTotal * 2.50
        }else{
            print("No value was provided")
            totalCostOfDrip = 0.00
            
        }
        
        if let hotTeaTotal = Double(hotTeaOrderTotal.text!){
           totalCostOfTea = hotTeaTotal * 2.00
        }else{
            print("No value was provided")
            totalCostOfTea = 0.00
        }
        
        if  let frenchPressTotal = Double(frenchPressOrderTotal.text!){
           totalCostOfFrench =  frenchPressTotal * 3.00
        }else{
            print("No value was provided")
            totalCostOfFrench = 0.00
        }
        
        if  let coldBrewTotal = Double(coldBrewOrderTotal.text!){
           totalCostOfCold = coldBrewTotal * 4.00
        }else {
            print("No value was provided")
            totalCostOfCold = 0.00
        
        if  let pastryTotal = Double(pastryOrderTotal.text!){
             totalCostOfPastry = pastryTotal * 2.00
        }else{
            print("No value was provided")
            totalCostOfPastry = 0.00
        }
        
        
        customerOrderTotal = totalCostOfDrip + totalCostOfTea + totalCostOfCold + totalCostOfFrench + totalCostOfPastry
        
            print("Your order total is \(customerOrderTotal)")
        
    }
    
    
         func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view.
               
               
               // this will close the text entry when you tap on the screen.
               let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
                      view.addGestureRecognizer(tap)
               
    }
    
    
    
}
}
