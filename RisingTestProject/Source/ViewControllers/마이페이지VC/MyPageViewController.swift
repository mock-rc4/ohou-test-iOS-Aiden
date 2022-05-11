//
//  MyPageViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit


final class MyPageViewController: BaseViewController {
    
    @IBOutlet weak var basketButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basketButton.addTarget(self, action: #selector(showBasketVC), for: .touchUpInside)
    }
}
