//
//  MainCategoryCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ category: String) {
        categoryImage.image = UIImage(named: "\(category).jpeg")
        categoryTitle.text = category
    }
}
