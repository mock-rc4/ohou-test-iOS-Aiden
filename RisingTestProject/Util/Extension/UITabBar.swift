//
//  UITabBar.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit


extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
        
    }
    
}
