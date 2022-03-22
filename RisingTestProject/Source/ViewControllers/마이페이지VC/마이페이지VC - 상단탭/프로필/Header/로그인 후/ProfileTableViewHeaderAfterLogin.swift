//
//  ProfileTableViewHeaderAfterLogin.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class ProfileTableViewHeaderAfterLogin: UITableViewCell {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var followings: UILabel!
    
    @IBOutlet weak var scrapCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
    func updateCell(_ userInfo: UserInfo) {
//        profileImage.image = UIImage(named: userInfo.profile_Img)
        profileImage.image = UIImage(named: "기본 프로필.png")
        nickName.text = userInfo.nickname
        followers.text = "\(userInfo.follower_Cnt)"
        followings.text = "\(userInfo.following_Cnt)"
        
        scrapCount.text = "스크랩북 \(userInfo.scrap_Cnt)"
        likeCount.text = "좋아요 \(userInfo.like_Cnt)"
    }
}
