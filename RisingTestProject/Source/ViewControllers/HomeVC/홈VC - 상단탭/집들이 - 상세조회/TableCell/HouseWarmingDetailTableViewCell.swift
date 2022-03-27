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
    
    
    func updateCell(_ title: String, content: String) {
        self.title.text = title
        self.content.text = content
    }
    
}
