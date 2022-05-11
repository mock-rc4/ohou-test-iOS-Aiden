//
//  ProductOptionViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit



final class ProductOptionViewController: BaseViewController {
    
    // MARK: - UI연결
    
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    @IBAction func minusButton(_ sender: UIButton) {
        let currentCount: Int = Int(orderCount.text!)!
        if currentCount > 1 {
            orderCount.text = String(currentCount-1)
            updateOrderPrice()
        }
    }
    @IBAction func plusButton(_ sender: UIButton) {
        orderCount.text = String(Int(orderCount.text!)!+1)
        updateOrderPrice()
    }
    @IBOutlet var forRadius: [UIView]!
    
    
    // 장바구니에 담기 버튼
    @IBAction func putInBasketButton(_ sender: UIButton) {
        // 장바구니 담기 API 호출
        if Constant.isUserLogged {
            PutInBasketDataManager().putInBasket(PutInBasketRequest(productId: orderProductID ?? 0, productCnt: Int(orderCount.text!)!), delegate: self)
        }else {
            presentAlert(title: "로그인 후 진행해주세요.")
        }
    }
    
    
    // 바로구매 버튼
    @IBOutlet weak var buyNowButton: UIButton!
    
    
    
    
    // 주문하는 제품 이름
    var orderProductName: String? {
        didSet {
            if let name = orderProductName {
                self.productName.text = name
            }
        }
    }
    
    // 기준가격
    var basePrice: Int = 0
    
    // 주문할 제품
    var orderProductID: Int?
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        forRadius.forEach({
//            $0.layer.cornerRadius = forRadius[0].frame.height / 10
//        })
//        forRadius[1].layer.borderColor = UIColor.systemCyan.cgColor
//        forRadius[1].layer.borderWidth = 1
//
//        totalPrice.text = (basePrice * Int(orderCount.text!)!).insertComma() + "원"
//
//        // 버튼 addTarget
//        buyNowButton.addTarget(self, action: #selector(showPaymentVC), for: .touchUpInside)
    }
    
    
    func updateOrderPrice() {
        totalPrice.text = (basePrice * Int(orderCount.text!)!).insertComma() + "원"
    }
    
    
    
    // MARK: - 왜 ViewDidLoad가 호출되지 않는지 찾아보기 !!! -> willAppear는 잘 작동함
    override func viewWillAppear(_ animated: Bool) {
        forRadius.forEach({
            $0.layer.cornerRadius = forRadius[0].frame.height / 10
        })
        forRadius[1].layer.borderColor = UIColor.systemCyan.cgColor
        forRadius[1].layer.borderWidth = 1
        
        totalPrice.text = (basePrice * Int(orderCount.text!)!).insertComma() + "원"
        
        // 버튼 addTarget
        buyNowButton.addTarget(self, action: #selector(showPaymentVC), for: .touchUpInside)
    }
    
    
    
}
