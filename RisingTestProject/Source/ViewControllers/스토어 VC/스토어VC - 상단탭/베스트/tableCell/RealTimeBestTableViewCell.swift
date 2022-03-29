//
//  RealTimeBestTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

class RealTimeBestTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var scrapImage: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    
    
    // 특가인지 무배인지 여부에 따라 히든: ture/false
    @IBOutlet weak var specialPrice: UILabel!
    @IBOutlet weak var freeDelivery: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productImage.layer.cornerRadius = productImage.frame.height / 8
        specialPrice.clipsToBounds = true
        specialPrice.layer.cornerRadius = specialPrice.frame.height / 8
        freeDelivery.clipsToBounds = true
        freeDelivery.layer.cornerRadius = specialPrice.frame.height / 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - Update함수 만들기!
    func updateCell(_ data: ProductCellInfoNoRemain, rank: Int) {
        productImage.load(url: URL(string: data.productImg1)!)
        productName.text = data.name
        companyName.text = data.company
        discountRate.text = "\(data.sale)%"
        price.text = data.salesPrice.insertComma()
        rating.text = "\(data.score)"
        reviews.text = "리뷰 \(data.reviewCnt)"
        if data.isScrap == 1 {
            scrapImage.image = UIImage(systemName: "bookmark.fill")
        }
        if data.isFree == 0 {
            freeDelivery.isHidden = true
        }
        if data.isSpecial == 0 {
            specialPrice.isHidden = true
        }
        rankLabel.text = "\(rank)"
}
}
    
    


