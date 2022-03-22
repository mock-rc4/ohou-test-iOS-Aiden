//
//  StoreTodayDealCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class StoreTodayDealCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var nDayLeft: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var reviews: UILabel!
    
    // 특가인지 여부에 따라 히든: ture/false
    @IBOutlet weak var specialPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    // MARK: - Update함수 만들기!
}
