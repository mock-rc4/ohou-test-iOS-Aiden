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
        // Initialization code
    }

    
    func updateCell(_ img: UIImage, text: String, _ companyImg: UIImage, company: String) {
        reviewImage.image = img
        reviewText.text = text
        companyImage.image = companyImg
        companyName.text = company
    }
}
