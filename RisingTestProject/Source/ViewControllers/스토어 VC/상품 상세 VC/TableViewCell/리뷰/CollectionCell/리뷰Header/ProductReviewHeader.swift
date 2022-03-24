//
//  ProductReviewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductReviewHeader: UICollectionViewCell {
    
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

}
