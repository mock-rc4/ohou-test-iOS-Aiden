//
//  ProductBestReviewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductBestReviewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var purchaseDate: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewText: UILabel!
    
    
    // 별
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell() {
        
    }
}
