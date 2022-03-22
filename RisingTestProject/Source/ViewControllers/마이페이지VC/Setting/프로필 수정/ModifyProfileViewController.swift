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
    
    @IBAction func didTapModifyButton(_ sender: UIButton) {
        // API 호출
        let request = ModifyProfileRequest(nickname: nickNameTextField.text, profile_Img: nil, Introduce: introduceTextField.text)
        ModifyProfileDataManager().modifyProtile(request, delegate: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
