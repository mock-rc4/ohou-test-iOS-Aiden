//
//  BottomSheetTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit

class BottomSheetTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var forRadiusView: UIView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var seeMoreImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forRadiusView.layer.borderColor = UIColor.darkGray.cgColor
        forRadiusView.layer.borderWidth = 1
        forRadiusView.layer.cornerRadius = forRadiusView.frame.height / 10
    }

    
    // 선택된 셀 UI 변경
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            forRadiusView.layer.borderColor = UIColor.systemCyan.cgColor
            forRadiusView.layer.borderWidth = 2
            seeMoreImage.tintColor = UIColor.systemCyan
            
        }else {
            forRadiusView.layer.borderColor = UIColor.darkGray.cgColor
            seeMoreImage.tintColor = UIColor.darkGray
            forRadiusView.layer.borderWidth = 1
        }
    }
    
    
    
    // 셀 간격 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 7, right: 0))
    }
    
    
    
    
    func updateCell(_ title: String) {
        cellTitle.text = title
    }
}
