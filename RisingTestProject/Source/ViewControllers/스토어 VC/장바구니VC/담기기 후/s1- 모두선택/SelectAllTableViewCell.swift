//
//  SelectAllTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

protocol selectAllButtonDelegate {
    func selectAll(_ isSelect: Bool)
}


class SelectAllTableViewCell: UITableViewCell {

    // 전체선택 버튼 구현을 위한 delegate
    var delegate: selectAllButtonDelegate?
    
    
    // UI 연결
    @IBOutlet weak var checkImage: UIImageView!
    
    var isButtonSelected: Bool = true
    // 모두선택 버튼
    @IBAction func didTapSelectAllButton(_ sender: UIButton) {
        isButtonSelected.toggle()
        if isButtonSelected {
            checkImage.image = UIImage(systemName: "checkmark.square.fill")
            delegate?.selectAll(isButtonSelected)
        }else {
            checkImage.image = UIImage(systemName: "square")
            delegate?.selectAll(isButtonSelected)
        }
    }
    
    // 삭제버튼
    @IBAction func didTapDeleteButton(_ sender: UIButton) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
