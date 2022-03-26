//
//  TotalPriceTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

class TotalPriceTableViewCell: UITableViewCell {

    // UI연결
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var totalDelivery: UILabel!
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
    
    
    func updateCell(totalP: Int, totalD: Int, discount: Int, finalP: Int) {
        totalPrice.text = totalP.insertComma() + "원"
        totalDelivery.text = totalD.insertComma() + "원"
        discountPrice.text = discount.insertComma() + "원"
        finalPrice.text = finalP.insertComma() + "원"
    }
}
