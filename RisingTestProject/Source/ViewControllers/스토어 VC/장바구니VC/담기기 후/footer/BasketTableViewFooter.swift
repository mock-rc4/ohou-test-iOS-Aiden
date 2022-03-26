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



class BasketTableViewFooter: UITableViewHeaderFooterView {

    var delegate: showPeymentVC?
    
    @IBAction func didTapBuyNowButton(_ sender: UIButton) {
        delegate?.showPeymentVC()
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
