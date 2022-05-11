//
//  UserStylingCollectionViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

final class UserStylingCollectionViewHeader: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var numberOfPhoto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(title: String, _ numberOfPhoto: Int) {
        photoTitle.text = title
        self.numberOfPhoto.text = "\(numberOfPhoto)"
    }
}
