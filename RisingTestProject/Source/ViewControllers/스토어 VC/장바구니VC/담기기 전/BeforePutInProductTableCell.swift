//
//  BeforePutInProductTableCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

final class BeforePutInProductTableCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var putInProductButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        putInProductButton.layer.cornerRadius = putInProductButton.frame.height / 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
