//
//  ProductReviewFooter.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductReviewFooter: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var seeMoreReviewButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        seeMoreReviewButton.layer.cornerRadius = seeMoreReviewButton.frame.height / 12
    }

    
    func updateCell(_ reviewCount: Int) {
        seeMoreReviewButton.setTitle("리뷰 더보기 (\(reviewCount))", for: .normal)
    }
}
