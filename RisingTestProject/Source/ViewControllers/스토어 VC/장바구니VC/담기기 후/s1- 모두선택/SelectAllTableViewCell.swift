//
//  SelectAllTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

class SelectAllTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var checkImage: UIImageView!
    
    // 모두선택 버튼
    @IBAction func didTapSelectAllButton(_ sender: UIButton) {
    }
    
    // 삭제버튼
    @IBAction func didTapDeleteButton(_ sender: UIButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
