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

    
    func updateCell(_ data: Exhibition) {
        image.load(url: URL(string: data.thumbnail)!)
        subTitle.text = data.subtitle
        title.text = data.title
        numberOfProduct.text = "\(data.goodsCnt)개 상품"
    }
}
