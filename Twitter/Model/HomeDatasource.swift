//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Emil Shafigin on 2/27/18.
//  Copyright © 2018 emksh. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {

        var users = [User]()
        
        let array = json["users"].array
        for userJson in array! {
            
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
    }
    
//    let users: [User] = {
//        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
//
//        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
//
//        let kindleCourseUser = User(name: "Kindle Course", username: "@kindlecourse", bioText: "The feature of Dynamic Cell Sizing based on its contents is very important in iOS Development.  Today, we'll look at how to achieve this effect with our UICollectionViewCell components based on the information that we have for each of our users.", profileImage: #imageLiteral(resourceName: "kindle_profile_image"))
//
//        return [brianUser, rayUser, kindleCourseUser]
//    }()
    
    let tweets: [Tweet] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet = Tweet(user: brianUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really really need a long text block to render out so we’re going to stop here.")
        
        let tweet2 = Tweet(user: brianUser, message: "This is the second tweet message for our sample project. Very very exciting message....")
        
        return [tweet, tweet2]
    }()
    
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
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }        
        return users[indexPath.item]
    }
}
