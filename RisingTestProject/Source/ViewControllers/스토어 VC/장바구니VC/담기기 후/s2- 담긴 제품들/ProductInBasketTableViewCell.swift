//
//  ProductInBasketTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

class ProductInBasketTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var productCountButton: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Pull Down버튼 설정
        let number1 = UIAction(title: "1", handler: {_ in self.productCountButton.setTitle("1", for: .normal)})
        let number2 = UIAction(title: "2", handler: {_ in self.productCountButton.setTitle("2", for: .normal)})
        let number3 = UIAction(title: "3", handler: {_ in self.productCountButton.setTitle("3", for: .normal)})
        let number4 = UIAction(title: "4", handler: {_ in self.productCountButton.setTitle("4", for: .normal)})
        let number5 = UIAction(title: "5", handler: {_ in self.productCountButton.setTitle("5", for: .normal)})
        let number6 = UIAction(title: "6", handler: {_ in self.productCountButton.setTitle("6", for: .normal)})
        let number7 = UIAction(title: "7", handler: {_ in self.productCountButton.setTitle("7", for: .normal)})
        let number8 = UIAction(title: "8", handler: {_ in self.productCountButton.setTitle("8", for: .normal)})
        let number9 = UIAction(title: "9", handler: {_ in self.productCountButton.setTitle("9", for: .normal)})
        let buttonMenu = UIMenu(title: "개수 선택", children: [number1, number2, number3, number4, number5, number6, number7, number8, number9])
        productCountButton.menu = buttonMenu
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
