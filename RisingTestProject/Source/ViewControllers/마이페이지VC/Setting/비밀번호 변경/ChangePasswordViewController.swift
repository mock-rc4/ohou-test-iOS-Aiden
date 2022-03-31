//
//  ChangePasswordViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/30.
//

import UIKit


class ChangePasswordViewController: BaseViewController {
    
    // MARK: - UI 연결
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var changePasswordButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRadiusToUIButton(changePasswordButton, size: changePasswordButton.frame.height / 10)
        
    }
    
    // 탭바 설정
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
