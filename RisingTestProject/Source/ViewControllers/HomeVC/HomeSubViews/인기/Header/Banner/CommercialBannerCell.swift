//
//  CommercialBannerCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

class CommercialBannerCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var commercialImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        commercialImage.layer.cornerRadius = commercialImage.frame.height / 10
    }

    
    func updateCell(_ image: UIImage) {
        commercialImage.image = image
    }
}
