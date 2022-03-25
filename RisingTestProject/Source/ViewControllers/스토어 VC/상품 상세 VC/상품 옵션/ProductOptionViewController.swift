//
//  ProductOptionViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit



class ProductOptionViewController: BaseViewController {
    
    // MARK: - UI연결
    
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    
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
    
    
    
    // 기준가격
    var basePrice: Int = 0
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forRadius.forEach({
            $0.layer.cornerRadius = forRadius[0].frame.height / 10
        })
        forRadius[1].layer.borderColor = UIColor.systemCyan.cgColor
        forRadius[1].layer.borderWidth = 1
        
        totalPrice.text = (basePrice * Int(orderCount.text!)!).insertComma()
    }
    
    
    func updateOrderPrice() {
        totalPrice.text = (basePrice * Int(orderCount.text!)!).insertComma() + "원"
    }
}
