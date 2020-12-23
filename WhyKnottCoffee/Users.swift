//
//  Users.swift
//  WhyKnottCoffee
//
//  Created by Ian Knott on 3/23/20.
//  Copyright © 2020 Ian Knott. All rights reserved.
//

import Foundation
import Firebase

struct Users{
    var email: String
    var beans: Int // from 1-3; could also be an enum
    var totalRewardCards: Int // numRatings
    
    
    var dictionary : [String: Any]{
        return[
            "email":email,
            "beans": beans,
            "totalRewardCards":totalRewardCards
        ]
        
        
    }


    
}
