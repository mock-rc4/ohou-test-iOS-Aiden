//
//  MediaCollectionViewFooter.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class MediaCollectionViewFooter: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var seeMoreButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ title: String) {
        seeMoreButton.setTitle("\(title) 더보기", for: .normal)
    }
}
