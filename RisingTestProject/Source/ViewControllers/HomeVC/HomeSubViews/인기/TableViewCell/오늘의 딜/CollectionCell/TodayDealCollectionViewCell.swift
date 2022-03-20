//
//  TodayDealCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class TodayDealCollectionViewCell: UICollectionViewCell {

    // MARK: - UI 연결
    @IBOutlet weak var forRadiusView: UIView!
    
    @IBOutlet weak var nDayLeft: UILabel!
    @IBOutlet weak var productInfo: UILabel!
    @IBOutlet weak var discountRate: CustomLabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 둥글게 처리
        forRadiusView.layer.cornerRadius = forRadiusView.frame.height / 10
    }

    
    func updateCell(_ leftDays: Int, _ info: String, _ rate: String) {
        nDayLeft.text = "\(leftDays)일 남음"
        productInfo.text = info
        discountRate.text = "\(rate)%"
    }
}
