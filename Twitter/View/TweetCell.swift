//
//  TweetCell.swift
//  Twitter
//
//  Created by developer on 3/1/18.
//  Copyright © 2018 emksh. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "profile_image")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImage)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
}
