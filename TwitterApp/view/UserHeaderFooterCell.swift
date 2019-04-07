//
//  UserHeaderFooterCell.swift
//  TwitterApp
//
//  Created by Balakrishna on 02/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import LBTAComponents

class UserHeaderCell : DatasourceCell{
    let textLabel : UILabel = {
        let label =  UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
          backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
class UserFooterCell : DatasourceCell{
    let textLabel : UILabel = {
        let label =  UILabel()
        label.text = "Show More .."
        label.font = UIFont.systemFont(ofSize: 18)
        let twiterBlue =  UIColor(r: 61, g: 167, b: 244)
        label.textColor = twiterBlue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(r: 231, g: 236, b: 241)
        
        
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant:0)
    }
}
