//
//  BasketTableViewFooter.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

protocol showPeymentVC {
    func showPeymentVC()
}



final class BasketTableViewFooter: UITableViewHeaderFooterView {

    var delegate: showPeymentVC?
    
    @IBAction func didTapBuyNowButton(_ sender: UIButton) {
        delegate?.showPeymentVC()
    }
    
    @IBOutlet weak var buyNowButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buyNowButton.layer.cornerRadius = buyNowButton.frame.height / 8
    }

}
