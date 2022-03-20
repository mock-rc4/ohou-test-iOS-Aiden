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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // 셀 업데이트 함수
    func updateCell(_ rank: Int, img: UIImage) {
        rankLabel.text = "\(rank)"
        postImage.image = img
    }
}
