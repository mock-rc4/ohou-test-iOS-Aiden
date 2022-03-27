//
//  OrderProductTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import UIKit

class OrderProductTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var forBorder: UIView!
    
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var deliveryCharge: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var orderCount: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forBorder.layer.borderColor = UIColor.systemGray5.cgColor
        forBorder.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // 장바구니VC에서 넘어올 때 사용할 함수
    func updateCellUseBasketProductInfo(_ info: BasketProductInfo) {
        company.text = info.company
        deliveryCharge.text = "배송비 " + info.deliveryCharge.insertComma() + "원"
        productImage.load(url: URL(string: info.productImg1)!)
        productName.text = info.name
        if info.salesPrice == 0 {
            productPrice.text = info.price.insertComma() + "원"
        }else {
            productPrice.text = info.salesPrice.insertComma() + "원"
        }
        orderCount.text = "\(info.productCnt)개"
    }
}
