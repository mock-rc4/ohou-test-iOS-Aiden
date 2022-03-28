//
//  ChooseProductToReviewTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit

class ChooseProductToReviewTableViewCell: UITableViewCell {

    // UI연결
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var delivery: UILabel!
    
    @IBOutlet weak var reviewButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewButton.layer.cornerRadius = reviewButton.frame.height / 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ data: ProductCellInfoNoRemain) {
        productImage.load(url: URL(string: data.productImg1)!)
        productName.text = data.name
        if data.isFree == 0 {
            delivery.text = "배송비 3,000원"
        }
    }
}
