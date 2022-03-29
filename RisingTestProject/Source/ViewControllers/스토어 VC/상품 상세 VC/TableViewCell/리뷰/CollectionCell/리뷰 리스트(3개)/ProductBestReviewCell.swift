//
//  ProductBestReviewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductBestReviewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var purchaseDate: UILabel!
    @IBOutlet weak var reviewImage: UIImageView!
    @IBOutlet weak var reviewText: UILabel!
    
    
    // 별
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(_ data: ReviewData) {
        nickName.text = data.nickname
        purchaseDate.text = data.time + " / 오늘의집 구매"
        if let img = data.reviewImg {
            reviewImage.load(url: URL(string: img)!)
        }else {
            reviewImage.isHidden = true
        }
        reviewText.text = data.contents
        
        
        // 별 조절
        switch data.score {
        case 5:
            return
        case 4..<5:
            star5.image = UIImage(systemName: "star")
        case 3..<4:
            star5.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
        case 2..<3:
            star5.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
        case 1..<2:
            star5.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            star2.image = UIImage(systemName: "star")
        default:
            star5.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            star2.image = UIImage(systemName: "star")
            star1.image = UIImage(systemName: "star")
        }
    }
}
