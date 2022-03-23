//
//  UserStylingCollectionViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class UserStylingCollectionViewHeader: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var numberOfPhoto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ numberOfPhoto: Int) {
        self.numberOfPhoto.text = "\(numberOfPhoto)"
    }
}
