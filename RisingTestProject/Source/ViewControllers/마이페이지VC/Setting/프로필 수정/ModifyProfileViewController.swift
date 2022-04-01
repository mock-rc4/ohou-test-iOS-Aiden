//
//  ModifyProfileViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class ModifyProfileViewController: BaseViewController {
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // UI 연결
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var introduceTextField: UITextField!
    @IBOutlet weak var modifyButton: UIButton!
    
    @IBAction func didTapModifyButton(_ sender: UIButton) {
        // API 호출
        let request = ModifyProfileRequest(nickname: nickNameTextField.text, profile_Img: nil, Introduce: introduceTextField.text)
        ModifyProfileDataManager().modifyProtile(request, delegate: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userNickName = Constant.userInfo?.nickname {
            nickNameTextField.text = userNickName
        }
        if let introduce = Constant.userInfo?.introduce {
            introduceTextField.text = introduce
        }
        
        addRadiusToUIButton(modifyButton, size: modifyButton.frame.height / 10)
        
        dismissKeyboardWhenTappedAround()
    }
    
    // 탭바 설정
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
