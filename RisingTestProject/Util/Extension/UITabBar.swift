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


extension UITabBar: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        // Check if bar item selected is center
                if viewController.tabBarItem.tag == 2 {


                    // Do Something Here ...
                    print("3번 VC")

                    // Present View Controller
//                    guard let navigationController = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else { return false }
//
//                    present(navigationController, animated: true)

                    // Returning false will not open the connected tab bar item view controller you attached to it
                    return false

                }

                // Return true to open the connected tab bar item view controller you attached to it (e.x. everything but the center item)
                return true
    }
}
