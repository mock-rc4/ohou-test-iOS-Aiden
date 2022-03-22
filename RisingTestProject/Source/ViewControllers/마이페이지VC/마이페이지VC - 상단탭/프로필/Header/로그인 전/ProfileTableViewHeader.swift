//
//  ProfileTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

protocol showLoginVC {
    func presentLoginVC()
}


class ProfileTableViewHeader: UITableViewHeaderFooterView {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        delegate?.presentLoginVC()
    }
    
    
    var delegate: showLoginVC?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
    }
    
}
