//
//  RecommendedProductCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class RecommendedProductCollectionViewCell: UICollectionViewCell {
    
    // UI 연결
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviews: UILabel!
    
    
    // 특가, 무배, 해외직구
    @IBOutlet weak var specialPrice: UILabel!
    @IBOutlet weak var freeDelivery: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Radius추가
        productImage.layer.cornerRadius = productImage.frame.height / 10
        specialPrice.clipsToBounds = true
        specialPrice.layer.cornerRadius = specialPrice.frame.height / 10

    }

    
    // MARK: - Update함수 만들기!
}
