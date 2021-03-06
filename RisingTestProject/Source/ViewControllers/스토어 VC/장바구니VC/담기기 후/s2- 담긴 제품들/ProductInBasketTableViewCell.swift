//
//  ProductInBasketTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit


protocol TableViewReload {
    func tableViewReload()
    
    // 제품 개수 변경
    func productCountUpdate(_ productID: Int, count: Int)
    
    // 제품 삭제버튼 클릭
    func deleteProduct(_ productID: Int)
    
    // 선택되었는지 여부 저장
    func saveIsProductSelected(_ productID: Int, isSelected: Bool)
}




final class ProductInBasketTableViewCell: UITableViewCell {

    // MARK: - UI연결
    
    @IBOutlet weak var checkImage: UIImageView!
    var isButtonSelected: Bool = true
    // 선택 버튼
    @IBAction func didTapSelectButton(_ sender: UIButton) {
        isButtonSelected.toggle()
        if isButtonSelected {
            checkImage.image = UIImage(systemName: "checkmark.square.fill")
            delegate?.saveIsProductSelected(productID, isSelected: true)
        }else {
            checkImage.image = UIImage(systemName: "square")
            delegate?.saveIsProductSelected(productID, isSelected: false)
        }
    }
    
    
    // 주문수량, 가격
    @IBOutlet weak var productCountButton: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var totalPrice: UILabel!  // 배송비 포함 가격
    
    // 판매업체명
    @IBOutlet weak var company: UILabel!
    
    // 제품 이미지, 이름
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productSubName: UILabel!
    
    
    // 배송비, 배송타입
    @IBOutlet weak var deliveryType: UILabel!
    @IBOutlet weak var deliveryCharge: UILabel!
    
    func updateCell(_ data: BasketProductInfo) {
        productID = data.productId
        productCountButton.setTitle("\(data.productCnt)", for: .normal)
        if data.salesPrice == 0 {
            basePrice = data.price
            let orderPrice: Int = data.price * data.productCnt
            price.text = orderPrice.insertComma() + "원"
            totalPrice.text = (orderPrice + data.deliveryCharge).insertComma() + "원"
        }else {
            basePrice = data.salesPrice
            let orderPrice: Int = data.salesPrice * data.productCnt
            price.text = orderPrice.insertComma() + "원"
            totalPrice.text = (orderPrice + data.deliveryCharge).insertComma() + "원"
        }
        company.text = data.company + " 배송"
        productImage.load(url: URL(string: data.productImg1)!)
        productName.text = data.name
        productSubName.text = data.name
        if data.isFree == 0 {
            delivery = data.deliveryCharge
            deliveryType.text = "50,000원 이상 무료배송 | 일반택배"
            deliveryCharge.text = "배송비 " + data.deliveryCharge.insertComma() + "원"
        }
    }
    
    
    // 상품 삭제 버튼
    @IBAction func didTapDeleteProductButton(_ sender: UIButton) {
        delegate?.deleteProduct(productID)
    }
    
    
    
    
    // basePrice
    var basePrice: Int = 0
    var delivery: Int = 0
    
    // 제품 ID
    var productID: Int = 0
    
    // delegate: 테이블뷰 리로드 위한
    var delegate: TableViewReload?
    
    
    
    // MARK: - Awake From Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Pull Down버튼 설정
        let number1 = UIAction(title: "1", handler: {_ in
            self.productCountButton.setTitle("1", for: .normal)
//            self.priceUpdate(count: 1)
            self.delegate?.productCountUpdate(self.productID, count: 1)
        })
        let number2 = UIAction(title: "2", handler: {_ in
            self.productCountButton.setTitle("2", for: .normal)
//            self.priceUpdate(count: 2)
            self.delegate?.productCountUpdate(self.productID, count: 2)
        })
        let number3 = UIAction(title: "3", handler: {_ in
            self.productCountButton.setTitle("3", for: .normal)
//            self.priceUpdate(count: 3)
            self.delegate?.productCountUpdate(self.productID, count: 3)
        })
        let number4 = UIAction(title: "4", handler: {_ in
            self.productCountButton.setTitle("4", for: .normal)
//            self.priceUpdate(count: 4)
            self.delegate?.productCountUpdate(self.productID, count: 4)
        })
        let number5 = UIAction(title: "5", handler: {_ in
            self.productCountButton.setTitle("5", for: .normal)
//            self.priceUpdate(count: 5)
            self.delegate?.productCountUpdate(self.productID, count: 5)
        })
        let number6 = UIAction(title: "6", handler: {_ in
            self.productCountButton.setTitle("6", for: .normal)
//            self.priceUpdate(count: 6)
            self.delegate?.productCountUpdate(self.productID, count: 6)
        })
        let number7 = UIAction(title: "7", handler: {_ in
            self.productCountButton.setTitle("7", for: .normal)
//            self.priceUpdate(count: 7)
            self.delegate?.productCountUpdate(self.productID, count: 7)
        })
        let number8 = UIAction(title: "8", handler: {_ in
            self.productCountButton.setTitle("8", for: .normal)
//            self.priceUpdate(count: 8)
            self.delegate?.productCountUpdate(self.productID, count: 8)
        })
        let number9 = UIAction(title: "9", handler: {_ in
            self.productCountButton.setTitle("9", for: .normal)
//            self.priceUpdate(count: 9)
            self.delegate?.productCountUpdate(self.productID, count: 9)
        })
        let buttonMenu = UIMenu(title: "개수 선택", children: [number1, number2, number3, number4, number5, number6, number7, number8, number9])
        productCountButton.menu = buttonMenu
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//    func priceUpdate(count: Int) {
//        let orderPrice: Int = basePrice * count
//        price.text = orderPrice.insertComma() + "원"
//        totalPrice.text = (orderPrice + delivery).insertComma() + "원"
//    }
    
    
    override func prepareForReuse() {
        self.productImage.image = UIImage(named: "기본이미지.jpeg")
    }
}
