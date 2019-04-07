//
//  TweetCell.swift
//  TwitterApp
//
//  Created by Balakrishna on 04/04/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let tweet = datasourceItem as? Tweet else {return}
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
    
            attributedText.append(NSAttributedString(string: "  \(tweet.user.userName) \n", attributes: [NSAttributedString.Key.font  :  UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
            messageLabel.attributedText = attributedText
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
            
        }
    }
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .clear
        
        addSubview(profileImageView)
        addSubview(messageLabel)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageLabel.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        self.addBottonViews()
    }
    
    let replyButton: UIButton = {
        let replayButton = UIButton(type: .system)
        replayButton.setImage(UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return replayButton
    }()
    let likeButton: UIButton = {
        let likeButton = UIButton(type: .system)
        likeButton.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return likeButton
    }()
    let retweetButton: UIButton = {
        let retweetButton =  UIButton(type: .system)
        retweetButton.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return retweetButton
    }()
    let sendMessageButton: UIButton = {
        let sendMessageButton =  UIButton(type: .system)
        sendMessageButton.setImage(UIImage(named: "send_message")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return sendMessageButton
    }()
    private func addBottonViews()
    {
        let replay = UIView()
        //replay.backgroundColor = .red
        let retweet = UIView()
        //retweet.backgroundColor = .green
        let like = UIView()
        //like.backgroundColor = .purple
        let sendMessage = UIView()
        //sendMessage.backgroundColor = .blue
        
        let bottomStackView = UIStackView(arrangedSubviews: [replay,retweet,like,sendMessage])
        
        addSubview(bottomStackView)
        bottomStackView.anchor(nil, left: messageLabel.leftAnchor, bottom: bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        bottomStackView.distribution = .fillEqually
        bottomStackView.axis = .horizontal
        
        addSubview(replyButton)
        addSubview(sendMessageButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        self.replyButton.anchor(replay.topAnchor, left: replay.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        self.sendMessageButton.anchor(sendMessage.topAnchor, left: sendMessage.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        self.retweetButton.anchor(retweet.topAnchor, left: retweet.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        self.likeButton.anchor(like.topAnchor, left: like.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)


    }

    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = UIImage(named: "gayle")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        
        return imageView
        
    }()
    
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "@build app"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        return label
    }()
}
