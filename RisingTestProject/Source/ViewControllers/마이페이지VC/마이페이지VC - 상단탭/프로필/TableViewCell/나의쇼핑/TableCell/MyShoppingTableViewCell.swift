//
//  MyShoppingTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class MyShoppingTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var coupon: UILabel!
    @IBOutlet weak var point: UILabel!
    
    @IBOutlet weak var forRadius: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forRadius.layer.cornerRadius = forRadius.frame.height / 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ order: Int, coupon: Int, point: Int) {
        self.orderCount.text = "\(order)"
        self.coupon.text = "\(coupon)"
        self.point.text = "\(point)"
    }
}
