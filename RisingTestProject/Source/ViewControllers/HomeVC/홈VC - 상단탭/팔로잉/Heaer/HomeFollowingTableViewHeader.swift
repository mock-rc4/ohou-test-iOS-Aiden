//
//  HomeFollowingTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

class HomeFollowingTableViewHeader: UITableViewHeaderFooterView {

    // UI 연결
    @IBOutlet weak var headerTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateCell(_ userNickname: String) {
        headerTitle.text = userNickname + "님을 위한 추천 유저"
    }
}
