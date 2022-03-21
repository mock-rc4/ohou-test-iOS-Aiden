//
//  PhotoCollectionViewFooter.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class PhotoCollectionViewFooter: UICollectionViewCell {

    
    // UI 연결
    @IBOutlet weak var forRadius: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forRadius.layer.cornerRadius = forRadius.frame.height / 10
    }

}
