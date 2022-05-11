//
//  ProductInfoTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit

final class ProductInfoTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - UI 연결
    
    // 제품 이미지, 이름
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
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
    
    // 배송비
    @IBOutlet weak var deliveryPrice: UILabel!
    
    // 특가인가?
    @IBOutlet weak var specialPrice: UILabel!
    
    // 광고 이미지
    @IBOutlet weak var commercialImage: UIImageView!
    
    // 별
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func updateCell(_ data: ProductDetail) {
        if let urlString = URL(string: data.productImg1) {
            productImage.load(url: urlString)
        }
        productName.text = data.name
        companyName.forEach({
            $0.text = data.company
        })
        reviewCount.text = "(\(data.reviewCnt))"
        discountRate.text = "\(data.sale)%"
        beforeDiscountPrice.text = data.price.insertComma() + "원"
        afterDiscountPrice.text = data.salesPrice.insertComma() + "원"
        bonusPoint.text = "\(data.benefit)P"
//        monthlyPrice.text = "월" + (data.price/6).insertComma + "원 (7개월) 무이자할부 >"
        monthlyPrice.text = "월 \((data.price/7).insertComma())원 (7개월) 무이자할부 >"
        if data.isFree == 0 {
            deliveryPrice.text = data.deliveryCharge.insertComma()
        }
        if data.isSpecial == 0 {
            specialPrice.isHidden = true
        }
        
        specialPrice.clipsToBounds = true
        specialPrice.layer.cornerRadius = specialPrice.frame.height / 8
        
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
