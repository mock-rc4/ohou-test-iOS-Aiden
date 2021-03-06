//
//  ProfileTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ title: String, count: String) {
        cellTitle.text = title
        self.count.text = count
    }
}
