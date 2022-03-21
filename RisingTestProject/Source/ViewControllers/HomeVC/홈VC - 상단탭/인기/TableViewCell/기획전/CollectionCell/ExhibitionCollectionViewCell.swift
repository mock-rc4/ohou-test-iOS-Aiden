//
//  ExhibitionCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class ExhibitionCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var numberOfProduct: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ img: UIImage, _ subT: String, _ mainT: String, numOfProduct: Int) {
        image.image = img
        subTitle.text = subT
        title.text = mainT
        numberOfProduct.text = "\(numOfProduct)개 상품"
    }
}
