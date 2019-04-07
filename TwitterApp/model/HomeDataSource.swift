//
//  HomeDataSource.swift
//  TwitterApp
//
//  Created by Balakrishna on 01/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.


import Foundation
import LBTAComponents
import UIKit
import Alamofire
import SwiftyJSON

protocol HomeUserRequestDeligate {
    func successResponse()
    func errorResponse(error : String)
}

class HomeDataSource : Datasource{
   var delgate : HomeUserRequestDeligate?
    var users = [User]()
    var tweets = [Tweet]()
    
    public func requestHomeFeed()
    {
        Service.sharedInstance.requestHomeFeed { (usersList, tweetsList,error) in
            if let err = error{
                self.delgate?.errorResponse(error: err)
                return
            }
            self.users = usersList!
            self.tweets = tweetsList!
            self.delgate?.successResponse()
        }
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooterCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if(section == 1)
        {
            return tweets.count
        }
        return users.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        if(indexPath.section == 1)
        {
            return tweets[indexPath.row]
        }
        return users[indexPath.row]
    }
    
}
