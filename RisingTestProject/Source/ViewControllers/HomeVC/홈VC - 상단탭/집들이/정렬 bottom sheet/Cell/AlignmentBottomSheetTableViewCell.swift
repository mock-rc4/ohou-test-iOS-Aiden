//
//  AlignmentBottomSheetTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

class AlignmentBottomSheetTableViewCell: UITableViewCell {

    // ui 연결
    @IBOutlet weak var cellTitle: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ title: String) {
        cellTitle.text = title
    }
}
