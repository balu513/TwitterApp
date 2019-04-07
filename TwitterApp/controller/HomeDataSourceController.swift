//
//  HomeDataSourceController.swift
//  TwitterApp
//
//  Created by Balakrishna on 01/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import UIKit

import LBTAComponents
class HomeDataSourceController : DatasourceController, HomeUserRequestDeligate {
    var homedataSource : HomeDataSource?
    func successResponse() {
        
        print("Successfully fetched Data")
        self.datasource = homedataSource
        
    }
    
    func errorResponse(error: String) {
        print("Error:  \(error)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // collectionView.backgroundColor = UIColor(r: 231, g: 236, b: 241)
        
        homedataSource = HomeDataSource()
       // self.datasource = homedataSource
        homedataSource?.delgate = self
        homedataSource?.requestHomeFeed()
        
        setupNavigationBar()
        fetchHomeData()
    }

    func fetchHomeData(){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section == 1){
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if(section == 1){
        return .zero
        }
        
        return CGSize(width: view.frame.width, height: 50+14)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.section == 0){
        if let user = datasource?.item(indexPath) as? User {
        
        let approximate_width_of_bio_textview = view.frame.width - 12 - 50 - 12-2
        let size = CGSize(width: approximate_width_of_bio_textview, height: 1000)
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 55)
            }
        }else if(indexPath.section == 1){
            if let tweet = datasource?.item(indexPath) as? Tweet{
                let approximate_width_of_bio_textview = view.frame.width - 12 - 50 - 12-2
                let size = CGSize(width: approximate_width_of_bio_textview, height: 1000)
                let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)]
                let estimatedFrame = NSString(string: tweet.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                return CGSize(width: view.frame.width, height: estimatedFrame.height + 75)
            }
        }
        return CGSize(width: view.frame.width, height: 100)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

