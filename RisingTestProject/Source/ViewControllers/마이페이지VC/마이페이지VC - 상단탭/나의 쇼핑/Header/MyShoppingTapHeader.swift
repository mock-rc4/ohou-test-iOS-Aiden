//
//  MyShoppingTapHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

final class MyShoppingTapHeader: UITableViewHeaderFooterView {

    // UI 연결
    @IBOutlet weak var forBorder1: UIView!
    @IBOutlet weak var forBorder2: UIView!
    @IBOutlet weak var forBorder: UIView!
    
    
    @IBOutlet weak var coupon: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var membership: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    
    
    func addBorderToUIView(_ view: UIView) {
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.layer.borderWidth = 1
    }
    
    func updateCell(_ coupon: Int, point: Int, membership: String) {
        self.coupon.text = "\(coupon)"
        self.point.text = "\(point)"
        self.membership.text = membership
    }
}
