//
//  ProductReviewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

final class ProductReviewHeader: UICollectionViewCell {
    
    // MARK: - UI 연결
    
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var reviewScore: UILabel!
    
    
    // ProgressView
    @IBOutlet weak var progress5: UIProgressView!
    @IBOutlet weak var progress4: UIProgressView!
    @IBOutlet weak var progress3: UIProgressView!
    @IBOutlet weak var progress2: UIProgressView!
    @IBOutlet weak var progress1: UIProgressView!
    
    
    
    // 평점별 리뷰 개수
    @IBOutlet weak var score5Count: UILabel!
    @IBOutlet weak var score4Count: UILabel!
    @IBOutlet weak var score3Count: UILabel!
    @IBOutlet weak var score2Count: UILabel!
    @IBOutlet weak var score1Count: UILabel!
    
    
    
    // 별
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    

    @IBOutlet weak var forRadius: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        forRadius.layer.cornerRadius = forRadius.frame.height / 9
    }

    
    func updateCell(reviewCount: Int, score: Int) {
        self.reviewCount.text = "\(reviewCount)"
        self.reviewScore.text = "\(score)"
        
        if score < 5 {
            score5Count.text = "\(Int(Double(reviewCount) * 0.9))"
            score4Count.text = "\(Int(Double(reviewCount) * 0.1))"
        }else {
            score5Count.text = "\(reviewCount)"
            progress4.progress = 0
            progress5.progress = 1
        }
        
        
        // 별 조절
        switch score {
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
