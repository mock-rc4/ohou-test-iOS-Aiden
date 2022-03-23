//
//  ProductInfoTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit

class ProductInfoTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - UI 연결
    // 카테고리
    @IBOutlet weak var productCategory: UILabel!
    
    // 제품 이미지, 이름
    @IBOutlet weak var produceImage: UIImageView!
    @IBOutlet weak var produceName: UILabel!
    
    // 판매회사
    @IBOutlet var companyName: [UILabel]!

    // 리뷰 수
    @IBOutlet weak var reviewCount: UILabel!
    
    // 가격
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var beforeDiscountPrice: UILabel!
    @IBOutlet weak var afterDiscountPrice: UILabel!
    
    // 포인트, 할부가격
    @IBOutlet weak var bonusPoint: UILabel!
    @IBOutlet weak var monthlyPrice: UILabel!
    
    // 특가인가?
    @IBOutlet weak var specialPrice: UILabel!
    
    // 광고 이미지
    @IBOutlet weak var commercialImage: UIImageView!
    
    
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
