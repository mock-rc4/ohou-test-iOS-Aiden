//
//  OngoingOrderTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class OngoingOrderTableViewCell: UITableViewCell {
    
    // UI 연결
    @IBOutlet weak var waitingForPayment: UILabel!
    @IBOutlet weak var paymentCompleted: UILabel!
    @IBOutlet weak var readyToShip: UILabel!
    @IBOutlet weak var inTransit: UILabel!
    @IBOutlet weak var deliveryCompleted: UILabel!
    @IBOutlet weak var writeReview: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ userInfo: UserInfo) {
        paymentCompleted.text = "\(userInfo.order_Cnt)"
    }
}
