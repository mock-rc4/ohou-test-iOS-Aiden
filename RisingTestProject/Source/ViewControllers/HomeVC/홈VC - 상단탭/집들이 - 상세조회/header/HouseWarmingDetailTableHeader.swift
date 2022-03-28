//
//  HouseWarmingDetailTableHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit

class HouseWarmingDetailTableHeader: UITableViewHeaderFooterView {
    
    // UI연결
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    
    @IBOutlet weak var housingType: UILabel!
    @IBOutlet weak var space: UILabel!
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var familyType: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    func updateCell(_ data: HouseWarmingDetailPost) {
        postImage.load(url: URL(string: data.houseImage)!)
        title.text = data.title
        housingType.text = data.housingType
        space.text = data.space
        field.text = data.field
        familyType.text = data.familyType
        
        
        // 전문가 아닌경우
        if data.isExpert == 0 {
            if let profile = data.profile_Img {
                if !profile.isEmpty {
                    profileImage.load(url: URL(string: profile)!)
                }
            }
            nickName.text = data.nickname
        }
        // 전문가인 경우
        else {
            if let profile = data.expertProfileImg {
                if !profile.isEmpty {
                    profileImage.load(url: URL(string: profile)!)
                }
            }
            nickName.text = data.expertName
        }
    }
}
