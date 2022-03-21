//
//  PopularityCollectionViewHeaderCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

class PopularityCollectionViewHeaderCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var subText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ title: String, _ sub: String = "") {
        headerText.text = title
        subText.text = sub
    }
}
