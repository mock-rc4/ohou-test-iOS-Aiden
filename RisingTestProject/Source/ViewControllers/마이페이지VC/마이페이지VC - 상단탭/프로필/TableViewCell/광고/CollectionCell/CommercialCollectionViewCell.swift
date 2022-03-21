//
//  CommercialCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class CommercialCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var commercialImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        commercialImage.layer.cornerRadius = commercialImage.frame.height / 10
    }

    
    func updateCell(_ img: UIImage) {
        commercialImage.image = img
    }
}
