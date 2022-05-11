//
//  AgreeTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

final class AgreeTableViewCell: UITableViewCell {

    var agreeIsSelected: Bool = false
    
    @IBOutlet weak var agreeImage: UIImageView!
    @IBAction func didTapAgreeButton(_ sender: UIButton) {
        agreeIsSelected.toggle()
        if agreeIsSelected {
            agreeImage.image = UIImage(systemName: "checkmark.square.fill")
            agreeImage.tintColor = UIColor.systemCyan
        }else {
            agreeImage.image = UIImage(systemName: "square")
            agreeImage.tintColor = UIColor.darkGray
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
