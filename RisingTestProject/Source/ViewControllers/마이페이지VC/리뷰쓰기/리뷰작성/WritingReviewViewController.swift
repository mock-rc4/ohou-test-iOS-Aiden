//
//  WritingReviewViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


class WritingReviewViewController: BaseViewController {
    
    // 작성하는 상품 고유번호
    var productID: Int?
    
    
    // 리뷰 값 저장
    var durabilityRating: Int = 0
    var designRating: Int = 0
    var priceRating: Int = 0
    var deliveryRating: Int = 0
    
    
    
    // MARK: - UI 연결
    // 상품정보
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var delivery: UILabel!
    
    // 내구성
    @IBOutlet weak var durabilityImage: UIImageView!
    @IBAction func durability1(_ sender: Any) {
        updateRatingImage(durabilityImage, rating: 1)
    }
    @IBAction func durability2(_ sender: Any) {
        updateRatingImage(durabilityImage, rating: 2)
    }
    @IBAction func durability3(_ sender: Any) {
        updateRatingImage(durabilityImage, rating: 3)
    }
    @IBAction func durability4(_ sender: Any) {
        updateRatingImage(durabilityImage, rating: 4)
    }
    @IBAction func durability5(_ sender: Any) {
        updateRatingImage(durabilityImage, rating: 5)
    }
    
    // 디자인
    @IBOutlet weak var designImage: UIImageView!
    @IBAction func design1(_ sender: Any) {
        updateRatingImage(designImage, rating: 1)
    }
    @IBAction func design2(_ sender: Any) {
        updateRatingImage(designImage, rating: 2)
    }
    @IBAction func design3(_ sender: Any) {
        updateRatingImage(designImage, rating: 3)
    }
    @IBAction func design4(_ sender: Any) {
        updateRatingImage(designImage, rating: 4)
    }
    @IBAction func design5(_ sender: Any) {
        updateRatingImage(designImage, rating: 5)
    }
    
    // 가격
    @IBOutlet weak var priceImage: UIImageView!
    @IBAction func price1(_ sender: Any) {
        updateRatingImage(priceImage, rating: 1)
    }
    @IBAction func price2(_ sender: Any) {
        updateRatingImage(priceImage, rating: 2)
    }
    @IBAction func price3(_ sender: Any) {
        updateRatingImage(priceImage, rating: 3)
    }
    @IBAction func price4(_ sender: Any) {
        updateRatingImage(priceImage, rating: 4)
    }
    @IBAction func price5(_ sender: Any) {
        updateRatingImage(priceImage, rating: 5)
    }
    
    // 배송
    @IBOutlet weak var deliveryImage: UIImageView!
    @IBAction func delivery1(_ sender: Any) {
        updateRatingImage(deliveryImage, rating: 1)
    }
    @IBAction func delivery2(_ sender: Any) {
        updateRatingImage(deliveryImage, rating: 2)
    }
    @IBAction func delivery3(_ sender: Any) {
        updateRatingImage(deliveryImage, rating: 3)
    }
    @IBAction func delivery4(_ sender: Any) {
        updateRatingImage(deliveryImage, rating: 4)
    }
    @IBAction func delivery5(_ sender: Any) {
        updateRatingImage(deliveryImage, rating: 5)
    }
    
    
    // 뒤로가기 버튼
    @IBAction func didTapDismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // 저장하기 버튼
    @IBOutlet weak var reviewSaveButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 radius추가
        reviewSaveButton.layer.cornerRadius = reviewSaveButton.frame.height / 10
    }
    
    
    // 평점 사진 업데이트
    func updateRatingImage(_ img: UIImageView, rating: Int) {
        switch rating {
        case 1:
            img.image = UIImage(named: "별 하나.jpeg")
        case 2:
            img.image = UIImage(named: "별 둘.jpeg")
        case 3:
            img.image = UIImage(named: "별 셋.jpeg")
        case 4:
            img.image = UIImage(named: "별 넷.jpeg")
        default:
            img.image = UIImage(named: "별 다섯.jpeg")
        }
    }
    
    
    func updateProductInfo(_ data: ProductCellInfoNoRemain) {
        productImage.load(url: URL(string: data.productImg1)!)
        productName.text = data.name
        if data.isFree == 0 {
            delivery.text = "배송비 3,000원"
        }
    }
}
