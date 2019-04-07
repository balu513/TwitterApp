//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by Balakrishna on 31/03/19.
//  Copyright © 2019 Balakrishna. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    let cellID = "HomeViewCellID"
    let headerID = "headerId"
    let footerId = "footerId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
       // collectionView.register(self, forCellWithReuseIdentifier: cellID)
        collectionView.register(WordCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .yellow
        return cell
    }
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if(kind == UICollectionView.elementKindSectionHeader)
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
            header.backgroundColor = .green
            return header
        }else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            footer.backgroundColor = .gray
            return footer
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
}

class WordCell : UICollectionViewCell
{
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(lableMessage)
        lableMessage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lableMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lableMessage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lableMessage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    var lableMessage: UILabel = {
       let lable = UILabel()
        lable.text = "Hello"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
}
