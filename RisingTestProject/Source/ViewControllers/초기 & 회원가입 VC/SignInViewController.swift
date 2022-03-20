//
//  SignInViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit

class SignInViewController: BaseViewController {
    
    // MARK: - UI 연결
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func didTapPopVCButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 로그인버튼 addTarget
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        // 버튼 Radius추가
        addRadiusToUIButton(loginButton, size: loginButton.frame.height / 10)
    }
    
    
    // objc 함수
    @objc func didTapLoginButton() {
        if emailTextField.text == "" {
            presentAlert(title: "이메일을 입력해 주세요.")
        }else if passwordTextField.text == "" {
            presentAlert(title: "비밀번호를 입력해 주세요.")
        }else {
            // API호출하여 이메일-비밀번호 맞는지 확인하고 UI 컨트롤
            presentAlert(title: "로그인 성공") { _ in
                guard let rootVC = self.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? UITabBarController else {
                    return
                }
                Constant.isUserLogged = true
                self.changeRootViewController(rootVC)
            }
        }
    }
}
