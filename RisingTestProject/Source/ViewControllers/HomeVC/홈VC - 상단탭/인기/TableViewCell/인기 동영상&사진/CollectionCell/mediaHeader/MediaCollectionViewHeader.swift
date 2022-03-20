//
//  MediaCollectionViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class MediaCollectionViewHeader: UICollectionViewCell {

    // UI연결
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var forRadiusView: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UIView에 Radius, border추가
        forRadiusView.layer.borderWidth = 1
        forRadiusView.layer.borderColor = UIColor.systemCyan.cgColor
        forRadiusView.layer.cornerRadius = forRadiusView.frame.height / 10
    }

    
    func updateCell(_ title: String) {
        titleLabel.text = "\(title) TOP 10"
    }
}
