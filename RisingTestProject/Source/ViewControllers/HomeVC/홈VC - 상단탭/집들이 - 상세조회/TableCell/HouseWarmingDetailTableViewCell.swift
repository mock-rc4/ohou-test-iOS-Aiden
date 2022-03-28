//
//  HouseWarmingDetailTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit

class HouseWarmingDetailTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ title: String, data: HouseWarmingDetailPost) {
        self.title.text = title
        
        if title == "주거형태" {
            content.text = data.housingType
        }else if title == "평수" {
            content.text = data.space
        }else if title == "지역" {
            content.text = data.area
        }else if title == "가족형태" {
            content.text = data.familyType
        }else if title == "작업자" {
            content.text = data.worker
        }
        // 전문가
        if data.isExpert == 1 {
            if title == "세부시공범위" {
                content.text = data.detailRange
            }
        }
    }
    
}
