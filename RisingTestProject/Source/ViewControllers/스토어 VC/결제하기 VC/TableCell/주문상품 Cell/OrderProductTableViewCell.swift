//
//  OrderProductTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import UIKit

class OrderProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var forBorder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forBorder.layer.borderColor = UIColor.systemGray5.cgColor
        forBorder.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
