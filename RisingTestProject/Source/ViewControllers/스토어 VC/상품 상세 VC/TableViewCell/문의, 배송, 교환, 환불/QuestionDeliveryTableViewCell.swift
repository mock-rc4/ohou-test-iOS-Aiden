//
//  QuestionDeliveryTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class QuestionDeliveryTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func updateCell(title: String, _ count: Int?) {
        mainTitle.text = title
        if let count = count {
            self.count.text = "\(count)"
        }
    }
}
