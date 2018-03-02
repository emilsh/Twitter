//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Emil Shafigin on 2/27/18.
//  Copyright © 2018 emksh. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))

        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindlecourse", bioText: "The feature of Dynamic Cell Sizing based on its contents is very important in iOS Development.  Today, we'll look at how to achieve this effect with our UICollectionViewCell components based on the information that we have for each of our users.", profileImage: #imageLiteral(resourceName: "kindle_profile_image"))
        
        return [brianUser, rayUser, kindleCourseUser]
    }()
    
    let tweets = ["tweet 1", "tweet 2"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
}
