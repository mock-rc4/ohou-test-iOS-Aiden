//
//  SettingTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    // UI연결
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var versionInfo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ title: String) {
        cellTitle.text = title
        if title == "버전 정보" {
            versionInfo.isHidden = false
        }
    }
}
