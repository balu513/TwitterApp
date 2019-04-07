//
//  Service.swift
//  TwitterApp
//
//  Created by Balakrishna on 07/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class Service{
    
    public static var sharedInstance = Service()
    
    public func requestHomeFeed(completion:@escaping ([User]?,[Tweet]?,String?)->())
    {
        let url = "https://api.letsbuildthatapp.com/twitter/home"
        //let url = "https://api.letsbuildthatapp.com/twitter/home_with_error"
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { (response) in
            
            if response.result.isFailure{
                completion(nil,nil,response.error?.localizedDescription)
            }
            
            let json = JSON(response.result.value!)
           
            // Parse UserFeeds
            guard let usersArrayJson =  json["users"].array else {
                completion(nil,nil,"user not valid from Json Response")
                return
                
            }
            var usersArray = [User]()
            for userJson in usersArrayJson{
                let user = User(json: userJson)
                usersArray.append(user)
            }
            
            // Parse Tweets
            guard let tweetArrayJson = json["tweets"].array else {return}
            var tweetsArray = [Tweet]()
            for tweet in tweetArrayJson{
                
              //  let message = tweet["message"].stringValue
              //  let userJson = tweet["user"]
              //  let user = User(json: userJson)
              //  let tweetObj = Tweet(user: user,message: message)
 
                let tweetObj =  Tweet(json: tweet)
                
                tweetsArray.append(tweetObj)
                
            }
            completion(usersArray,tweetsArray,nil)
        }
    }
}
