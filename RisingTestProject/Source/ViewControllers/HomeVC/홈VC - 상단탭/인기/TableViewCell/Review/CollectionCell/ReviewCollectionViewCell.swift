//
//  ReviewCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewImage.layer.cornerRadius = reviewImage.frame.height / 10
        companyImage.layer.cornerRadius = companyImage.frame.height / 2
    }

    
    func updateCell(_ data: InteriorReview) {
        reviewImage.load(url: URL(string: data.img)!)
        reviewText.text = data.contents
        companyName.text = data.name
        if let profileImg = data.profileImg {
            if !profileImg.isEmpty {
                companyImage.load(url: URL(string: profileImg)!)
            }
        }
    }
}
