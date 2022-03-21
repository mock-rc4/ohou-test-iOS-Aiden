//
//  PhotoCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var image: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ img: UIImage) {
        image.image = img
    }
}
