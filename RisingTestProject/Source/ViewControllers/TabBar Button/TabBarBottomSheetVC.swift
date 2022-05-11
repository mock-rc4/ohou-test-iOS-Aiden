//
//  TabBarBottomSheetVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//

import UIKit


final class TabBarBottomSheetVC: BaseViewController {
    
    // UI연결
    @IBAction func didTapReviewButton(_ sender: UIButton) {
        guard let reviewVC = storyboard?.instantiateViewController(withIdentifier: "ChooseProductToReviewVC") as? ChooseProductToReviewVC else {
            return
        }
        self.dismiss(animated: true)
        self.navigationController?.pushViewController(reviewVC, animated: true)
    }
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
