//
//  ProfileTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class ProfileTableViewHeader: UITableViewHeaderFooterView {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var followings: UILabel!
    
    
    @IBOutlet weak var followStackView: UIStackView!
    @IBOutlet weak var forRadius: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forRadius.layer.cornerRadius = forRadius.frame.height / 10
    }
    
    
    
    func updateCell(_ img: UIImage = UIImage(named: "기본 프로필.png") ?? UIImage(), userNickName: String, _ userFollowers: Int, _ userFollowings: Int) {
        profileImage.image = img
        nickName.text = userNickName
        followers.text = "\(userFollowers)"
        followings.text = "\(userFollowings)"
    }
}
