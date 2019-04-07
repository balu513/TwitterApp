//
//  User.swift
//  TwitterApp
//
//  Created by Balakrishna on 02/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

struct User {
    var name : String
    var userName: String
    var bioText: String
    var profileImageUrl : String

    init(json:JSON) {
        self.name = json["name"].stringValue
        self.userName = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
    
}
