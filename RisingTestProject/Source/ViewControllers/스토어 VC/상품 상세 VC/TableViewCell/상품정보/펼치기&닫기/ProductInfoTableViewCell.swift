//
//  ProductInfoTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit
import ExpyTableView

class ProductInfoTableViewCell: UITableViewCell {

    
    // UI 연결
    @IBOutlet weak var exTitleLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        exTitleLabel.clipsToBounds = true
        exTitleLabel.layer.cornerRadius = exTitleLabel.frame.height / 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



extension ProductInfoTableViewCell: ExpyTableViewHeaderCell {
    func changeState(_ state: ExpyState, cellReuseStatus cellReuse: Bool) {
        switch state {
        case .willExpand:
            print("펼쳐질거다: willExpand")
        case .willCollapse:
            print("닫힐거다: willCollapse")
        case .didExpand:
            exTitleLabel.text = "상품정보 접기"
        case .didCollapse:
            exTitleLabel.text = "상품정보 펼치기"
        }
    }
    
}
