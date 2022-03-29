//
//  ProductReviewPhotoCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductReviewPhotoCell: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var reviewImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewImage.layer.cornerRadius = reviewImage.frame.height / 10
    }

    
    
    func updateCell(_ imgString: String) {
        if let url = URL(string: imgString) {
            reviewImage.load(url: url)
        }
    }
}
