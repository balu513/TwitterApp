//
//  HomeDataSourceController+navbar.swift
//  TwitterApp
//
//  Created by Balakrishna on 04/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import UIKit

extension HomeDataSourceController{
    
    public func setupNavigationBar(){
        setLeftNavigationItems()
        setRightNavigationItems()
        setRemainNavigationItems()
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setLeftNavigationItems() {
        
        let followButton = UIButton(type: .system)
        let followImage = UIImage(named: "follow")
        followButton.setImage(followImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        
    }
    private func setRightNavigationItems() {
        let searchButton =  UIButton(type: .system)
        let searchImage = UIImage(named: "search")
        searchButton.setImage(searchImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        let composeImage = UIImage(named: "compose")
        composeButton.setImage(composeImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
        
    }
    private func setRemainNavigationItems() {
        let titelImage = UIImage(named: "title_icon")
        let titleImageView = UIImageView(image: titelImage!)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let navBarSeparatorview = UIView()
        navBarSeparatorview.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorview)
        navBarSeparatorview.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        
    }
}
