//
//  DeliveryAddressTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import UIKit

class DeliveryAddressTableViewCell: UITableViewCell {

    // ui연결
    @IBOutlet weak var userNickName: UILabel!
    
    var setDefaultIsSelected: Bool = false
    
    @IBOutlet weak var setDefaultImage: UIImageView!
    @IBAction func didTapAgreeButton(_ sender: UIButton) {
        setDefaultIsSelected.toggle()
        if setDefaultIsSelected {
            setDefaultImage.image = UIImage(systemName: "checkmark.square.fill")
            setDefaultImage.tintColor = UIColor.systemCyan
        }else {
            setDefaultImage.image = UIImage(systemName: "square")
            setDefaultImage.tintColor = UIColor.darkGray
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNickName.text = Constant.userInfo?.nickname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
