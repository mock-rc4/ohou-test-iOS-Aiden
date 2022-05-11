//
//  InteriorTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//

import UIKit

final class InteriorTableViewCell: UITableViewCell {

    // MARK: - UI연결
    
    // 테두리
    @IBOutlet weak var forRadiusAndBorder: UIView!
    
    // 응답빠름, 전문건설업 아이콘
    @IBOutlet weak var quickResponse: PaddingLabel!
    @IBOutlet weak var isExpert: PaddingLabel!
    
    // API로 업데이트할 내용
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var contract: UILabel!
    
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UI 설정
        forRadiusAndBorder.layer.borderColor = UIColor.lightGray.cgColor
        forRadiusAndBorder.layer.borderWidth = 1
        forRadiusAndBorder.layer.cornerRadius = 8
        
        quickResponse.clipsToBounds = true
        isExpert.clipsToBounds = true
        quickResponse.layer.cornerRadius = 5
        isExpert.layer.cornerRadius = 5
        
        postImage.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func updateCell(_ data: InteriorPost) {
        postImage.load(url: URL(string: data.profileImg)!)
        companyName.text = data.name
        score.text = "\(data.score)"
        distance.text = "\(data.distance)km"
        contract.text = "\(data.contract)"
    }
}
