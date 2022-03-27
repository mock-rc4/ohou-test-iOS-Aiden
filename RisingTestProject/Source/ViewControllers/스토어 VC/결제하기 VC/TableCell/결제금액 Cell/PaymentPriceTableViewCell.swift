//
//  PaymentPriceTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

class PaymentPriceTableViewCell: UITableViewCell {

    // UI연결
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var deliveryCharge: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(totalP: Int, deliveryP: Int, discountP: Int, finalP: Int) {
        totalPrice.text = totalP.insertComma() + "원"
        deliveryCharge.text = deliveryP.insertComma() + "원"
        discountPrice.text = discountP.insertComma() + "원"
        finalPrice.text = finalP.insertComma() + "원"
    }
}
