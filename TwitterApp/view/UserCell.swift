//
//  UserCell.swift
//  TwitterApp
//
//  Created by Balakrishna on 02/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import LBTAComponents

class UserCell : DatasourceCell{
    
    override  var datasourceItem : Any?{
        didSet{
            print(datasourceItem as Any)
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            usernameLabel.text = user.userName
            bioLable.text = user.bioText
            profileImage.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chris Gayle"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.backgroundColor = .green
        
        return label
    }()
    let usernameLabel : UILabel = {
        let label =  UILabel()
        label.text = "@buildapp"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        //label.backgroundColor = .purple
        return label
    }()
    let profileImage : CachedImageView = {
        let profile = CachedImageView()
        profile.image = UIImage(named: "profileimage")
        profile.layer.cornerRadius = 5
        profile.layer.masksToBounds = true
        //profile.backgroundColor = .red
        
        return profile
        
    }()
    let bioLable : UILabel = {
        let label  =  UILabel()
        label.text = "Gayle played for the West Indies at youth international level prior to making his first-class debut in 1998, at age 19 for Jamaica. He played his first One Day International eleven months later, and his first Test match six months after that. Gayle, who normally opens the innings when he plays for the West Indies, is a destructive batsman who is most effective playing square of the wicket."
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        //label.backgroundColor = .yellow
        return label
    }()
    
    let followButton : UIButton = {
        let button = UIButton()
        //button.backgroundColor = .cyan
        let twiterBlue =  UIColor(r: 61, g: 167, b: 244)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = twiterBlue.cgColor
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twiterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(usernameLabel)
        addSubview(bioLable)
        addSubview(followButton)
        backgroundColor =  .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        profileImage.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20 )
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioLable.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 100, heightConstant: 35)
        
    }
}

