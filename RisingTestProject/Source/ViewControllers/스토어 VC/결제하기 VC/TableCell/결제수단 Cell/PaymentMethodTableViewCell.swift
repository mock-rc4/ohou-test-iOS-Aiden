//
//  PaymentMethodTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import UIKit

final class PaymentMethodTableViewCell: UITableViewCell {

    @IBOutlet var buttomGroub: [UIButton]!
    
    var selectedView: UIView?
    
    @IBOutlet weak var cardView: UIView!
    @IBAction func didTapCardButton(_ sender: UIButton) {
        if let view = selectedView {
            deselected(view)
        }
        selected(cardView)
        selectedView = cardView
    }
    
    
    @IBOutlet weak var naverView: UIView!
    @IBAction func didTapNaverButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(naverView)
        selectedView = naverView
    }
    
    
    @IBOutlet weak var creditView: UIView!
    @IBAction func didTapCreditButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(creditView)
        selectedView = creditView
    }
    
    
    
    @IBOutlet weak var paycoView: UIView!
    @IBAction func didTapPaycoButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(paycoView)
        selectedView = paycoView
    }
    
    
    
    @IBOutlet weak var kakaoView: UIView!
    @IBAction func didTapKakaoButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(kakaoView)
        selectedView = kakaoView
    }
    
    
    @IBOutlet weak var chaiView: UIView!
    @IBAction func didTapChaiButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(chaiView)
        selectedView = chaiView
    }
    
    
    @IBOutlet weak var tossView: UIView!
    @IBAction func didTapTossButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(tossView)
        selectedView = tossView
    }
    
    
    
    @IBOutlet weak var phoneView: UIView!
    @IBAction func didTapPhoneButton(_ sender: Any) {
        if let view = selectedView {
            deselected(view)
        }
        selected(phoneView)
        selectedView = phoneView
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttomGroub.forEach({
            deselected($0)
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func selected(_ view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.systemCyan.cgColor
    }
    
    func deselected(_ view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
}
