//
//  HomeExpertCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

class HomeExpertCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var bookmarkImage: UIImageView!
    @IBOutlet weak var postingImage: UIImageView!
    @IBOutlet weak var postingTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var scrapsAndViews: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postingImage.layer.cornerRadius = postingImage.frame.height / 10
        profileImage.layer.cornerRadius = profileImage.frame.height / 2

    }

    
    
    func updateCell(_ data: ExpertPost) {
        if data.isNew == 0 {
            newImage.isHidden = true
        }
        if data.isScrap == 1 {
            bookmarkImage.image = UIImage(systemName: "bookmark.fill")
        }
        postingImage.load(url: URL(string: data.houseImage)!)
        postingTitle.text = data.title
        if let userImage = data.profileImg {
            if !userImage.isEmpty {
                self.profileImage.load(url: URL(string: userImage)!)
            }
        }
        nickName.text = data.name
        scrapsAndViews.text = "\(data.scrapCnt)명 스크랩 | \(data.checkCnt)명 조회"
    }
    
    
    override func prepareForReuse() {
        postingImage.image = UIImage(named: "기본이미지.jpeg")
    }
}
