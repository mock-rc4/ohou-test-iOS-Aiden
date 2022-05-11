//
//  PaymentTableViewFooter.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

protocol PaymentDelegateProtocol {
    func payment()
}


final class PaymentTableViewFooter: UITableViewHeaderFooterView {

    // 결제 API호출 delegate
    var delegate: PaymentDelegateProtocol?
    
    
    // 결제금액
    var totalPrice: Int?
    
    // UI 연결
    @IBOutlet weak var paymentButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paymentButton.layer.cornerRadius = paymentButton.frame.height / 10
        paymentButton.addTarget(self, action: #selector(didTapPaymentButton), for: .touchUpInside)
    }

    
    func updateCell(_ price: Int) {
        totalPrice = price
        paymentButton.setTitle(price.insertComma() + "원 결제하기", for: .normal)
    }
    
    @objc func didTapPaymentButton() {
        delegate?.payment()
    }
}
