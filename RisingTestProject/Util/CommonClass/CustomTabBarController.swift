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
        
        // 그림자 설정
        setupStyle()
        
        // delegate 지정
        self.delegate = self
    }
    
    
    // 기본 탭바 스타일 (그림자)
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
    
    
    
}


extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        if viewController.tabBarItem.tag == 4{

            print("+버튼")
            return false
        }

        return true
    }
    
    
    
    
}


