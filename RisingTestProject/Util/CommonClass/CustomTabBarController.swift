//
//  CustomTabBarController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit


class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
}