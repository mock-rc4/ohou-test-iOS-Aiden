//
//  TodayDealTabCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class TodayDealTabCell: UITableViewCell {
    
    // UI 연결
    @IBOutlet weak var nDayLeft: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var scrapImage: UIImageView!
    @IBOutlet weak var freeDelivery: UILabel!
    
    
    // 특가인지 여부에 따라 히든: ture/false
    @IBOutlet weak var specialPrice: UILabel!
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Radius추가
        productImage.layer.cornerRadius = productImage.frame.height / 8
        nDayLeft.clipsToBounds = true
        nDayLeft.layer.cornerRadius = nDayLeft.frame.height / 8
        specialPrice.clipsToBounds = true
        specialPrice.layer.cornerRadius = specialPrice.frame.height / 8
        freeDelivery.clipsToBounds = true
        freeDelivery.layer.cornerRadius = specialPrice.frame.height / 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: - Update함수
    func updateCell(_ data: ProductCellInfo) {
        nDayLeft.text = "\(data.remainDays)일 남음"
        productImage.load(url: URL(string: data.productImg1)!)
        companyName.text = data.company
        discountRate.text = "\(data.sale)%"
        price.text = "\(data.salesPrice)"
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
    }
    
    
    
    // 셀 간격 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 0))
    }
}
