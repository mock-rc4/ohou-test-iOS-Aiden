//
//  UserStylingCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

final class UserStylingCollectionViewCell: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var userPhoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userPhoto.layer.cornerRadius = userPhoto.frame.width / 10
    }

    
    func updateCell(_ url: String) {
        if let url = URL(string: url) {
            userPhoto.load(url: url)
        }
    }
}
