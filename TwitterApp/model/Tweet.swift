//
//  Tweet.swift
//  TwitterApp
//
//  Created by Balakrishna on 05/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user : User
    let message : String
    
    init(json : JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
