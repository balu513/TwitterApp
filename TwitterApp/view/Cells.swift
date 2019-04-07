//
//  Cells.swift
//  TwitterApp
//
//  Created by Balakrishna on 01/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
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
      //  backgroundColor = .red
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
       // backgroundColor = .gray
        addSubview(textLabel)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant:0)
    }
}
