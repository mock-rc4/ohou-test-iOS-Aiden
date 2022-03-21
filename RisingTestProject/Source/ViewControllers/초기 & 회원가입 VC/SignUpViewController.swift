//
//  SignUpViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit


class SignUpViewController: BaseViewController {
    
    // MARK: - UI연결
    // 뒤로가기 버튼
    @IBAction func didTapPopVCButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // 이메일 인증하기 버튼
    @IBOutlet weak var checkEmailButton: UIButton!
    
    // 회원가입 완료 버튼
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // 약관동의 버튼
    @IBOutlet weak var allAgreeButton: UIButton!
    @IBOutlet weak var essentialAgreeButton1: UIButton!
    @IBOutlet weak var essentialAgreeButton2: UIButton!
    @IBOutlet weak var essentialAgreeButton3: UIButton!
    @IBOutlet weak var chooseAgreeButton: UIButton!
    
    
    
    
    // MARK: - 텍스트필드 연결
    // 이메일
    @IBOutlet weak var emailTextField: UITextField!
    
    // 비밀번호, 비밀번호 확인
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var CheckPasswordTextField: UITextField!
    
    // 별명
    @IBOutlet weak var nickNameTextField: UITextField!
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 버튼 폰트사이즈 변경
        checkEmailButton.setFontSize((checkEmailButton.titleLabel?.text!)!, size: 17)
        signUpButton.setFontSize((signUpButton.titleLabel?.text)!, size: 18)
        
        
        // 이메일 확인 버튼 addTarget
        checkEmailButton.addTarget(self, action: #selector(didTapCheckEmailButton), for: .touchUpInside)
        
        // 약관동의 버튼 addTarget
        allAgreeButton.addTarget(self, action: #selector(toggleAllAgreeButton(_:)), for: .touchUpInside)
        essentialAgreeButton1.addTarget(self, action: #selector(toggleAgreeButton(_:)), for: .touchUpInside)
        essentialAgreeButton2.addTarget(self, action: #selector(toggleAgreeButton(_:)), for: .touchUpInside)
        essentialAgreeButton3.addTarget(self, action: #selector(toggleAgreeButton(_:)), for: .touchUpInside)
        chooseAgreeButton.addTarget(self, action: #selector(toggleAgreeButton(_:)), for: .touchUpInside)
        
        // 회원가입 버튼 addTarget
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    
    
    // MARK: - objc함수
    
    // 이메일 텍스트필드의 값을 확인하고 적절한 Alert 띄우기
    @objc func didTapCheckEmailButton() {
        if emailTextField.text == "" {
            presentAlert(title: "이메일을 입력해 주세요.")
        }else if emailTextField.text!.contains("@") {
            presentAlert(title: "인증되었습니다.")
        }else {
            presentAlert(title: "정확한 이메일을 입력해 주세요.")
        }
        
    }
    
    
    // 전체동의 버튼 isSelected 토글
    @objc func toggleAllAgreeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        essentialAgreeButton1.isSelected = true
        essentialAgreeButton2.isSelected = true
        essentialAgreeButton3.isSelected = true
        chooseAgreeButton.isSelected = true
    }
    // 개별동의 버튼 isSelected 토글
    @objc func toggleAgreeButton(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
    // 회원가입 완료 버튼
    @objc func didTapSignUpButton() {
        if emailTextField.text == "" {
            presentAlert(title: "이메일을 입력해 주세요.")
        }else if passwordTextField.text == "" {
            presentAlert(title: "비밀번호를 입력해 주세요.")
        }else if CheckPasswordTextField.text == "" {
            presentAlert(title: "비밀번호 확인을 입력해 주세요.")
        }else if passwordTextField.text != CheckPasswordTextField.text {
            presentAlert(title: "비밀번호가 일치하지 않습니다.")
        }else if nickNameTextField.text == "" {
            presentAlert(title: "별명을 입력해 주세요.")
        }else if essentialAgreeButton1.isSelected && essentialAgreeButton2.isSelected && essentialAgreeButton3.isSelected {
            
            let request = SignUpRequest(email: emailTextField.text!, password: passwordTextField.text!, nickname: nickNameTextField.text!)
            SignUpDataManager().postSignUp(request, delegate: self)
        }else {
            presentAlert(title: "필수동의 사항에 체크해주세요.")
        }
    }
}
