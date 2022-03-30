//
//  CustomTabBarController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit
import MaterialComponents.MaterialBottomSheet


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
            guard let tabbarBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "TabBarButtonNavigationController") as? UINavigationController else {
                return false
            }
            let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: tabbarBottomSheetVC)
            bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 500
            present(bottomSheet, animated: true)
            
            return false
        }

        return true
    }
    
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//
////        self.tabBarController?.selectedIndex = 2
//        for tabBarItem in (self.tabBar.items)!{
//
//            let viewTabBar = tabBarItem.value(forKey: "view") as? UIView
//
//            let  imgView = viewTabBar?.subviews[0] as? UIImageView
////            viewTabBar?.origin.y  = 6
//            imgView?.frame.size.height = 24
//            imgView?.frame.size.width = 24
//            imgView?.clipsToBounds = true
//            imgView?.contentMode = .scaleAspectFit
//        }
//    }
//
//
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        for tabBarItem in (self.tabBar.items)!{
//
//            let viewTabBar = tabBarItem.value(forKey: "view") as? UIView
//            let  imgView = viewTabBar?.subviews[0] as? UIImageView
//            imgView?.frame.size.height = 24
//            imgView?.frame.size.width = 24
//
//            imgView?.clipsToBounds = true
//            imgView?.contentMode = .scaleAspectFit
//        }
//    }
}


