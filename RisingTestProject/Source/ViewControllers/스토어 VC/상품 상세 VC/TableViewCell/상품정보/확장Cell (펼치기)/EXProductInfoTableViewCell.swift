//
//  EXProductInfoTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class EXProductInfoTableViewCell: UITableViewCell {

    // UI연결
    @IBOutlet weak var productImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func updateCell(_ imgString: String) {
        productImage.load(url: URL(string: imgString)!)
    }
}
