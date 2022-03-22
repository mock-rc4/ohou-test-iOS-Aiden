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
    
    
    // Constraint 연결
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        commercialImage.layer.cornerRadius = commercialImage.frame.height / 10
    }

    
    func updateCell(_ image: UIImage) {
        commercialImage.image = image
    }
    
    
    func setConstraintZero() {
        bottom.constant = 0
        top.constant = 0
        trailing.constant = 0
        leading.constant = 0
        commercialImage.layer.cornerRadius = 0
    }
}
