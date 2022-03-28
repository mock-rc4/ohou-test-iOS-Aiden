//
//  MediaRankCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class MediaRankCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        postImage.layer.cornerRadius = postImage.frame.height / 15
    }

    
    // 셀 업데이트 함수
    func updateCell(_ rank: Int, data: PopularityPhoto) {
        rankLabel.text = "\(rank)"
        postImage.load(url: URL(string: data.photo)!)
        nickName.text = data.nickname
    }
}
