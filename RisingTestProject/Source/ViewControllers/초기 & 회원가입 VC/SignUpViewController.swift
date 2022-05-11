//
//  SignUpViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/20.
//

import UIKit



// MARK: - 약관동의 데이터 [Bool] 형식으로 수정 -> didSet 사용

final class SignUpViewController: BaseViewController {
    
    func updateAllAgreeButton() {
        allAgree = [essentialAgree1, essentialAgree2, essentialAgree3, chooseAgree].allSatisfy({$0})
    }
    
    
    // MARK: - 약관동의 관련
    var allAgree: Bool = false {
        didSet {
            if allAgree {
                allAgreeButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            }else {
                allAgreeButton.setImage(UIImage(systemName: "square"), for: .normal)
            }
        }
    }
    var essentialAgree1: Bool = false {
        didSet {
            if essentialAgree1 {
                essentialAgreeButton1.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                updateAllAgreeButton()
            }else {
                essentialAgreeButton1.setImage(UIImage(systemName: "square"), for: .normal)
                updateAllAgreeButton()
            }
        }
    }
    var essentialAgree2: Bool = false {
        didSet {
            if essentialAgree2 {
                essentialAgreeButton2.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                updateAllAgreeButton()
            }else {
                essentialAgreeButton2.setImage(UIImage(systemName: "square"), for: .normal)
                updateAllAgreeButton()
            }
        }
    }
    var essentialAgree3: Bool = false {
        didSet {
            if essentialAgree3 {
                essentialAgreeButton3.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                updateAllAgreeButton()
            }else {
                essentialAgreeButton3.setImage(UIImage(systemName: "square"), for: .normal)
                updateAllAgreeButton()
            }
        }
    }
    var chooseAgree: Bool = false {
        didSet {
            if chooseAgree {
                chooseAgreeButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
                updateAllAgreeButton()
            }else {
                chooseAgreeButton.setImage(UIImage(systemName: "square"), for: .normal)
                updateAllAgreeButton()
            }
        }
    }
    

    
    @IBAction func didTapAllAgree(_ sender: UIButton) {
        allAgree.toggle()
    }
    @IBAction func didTapEssentialAgree1(_ sender: UIButton) {
        essentialAgree1.toggle()
    }
    @IBAction func didTapEssentialAgree2(_ sender: UIButton) {
        essentialAgree2.toggle()
    }
    @IBAction func didTapEssentialAgree3(_ sender: UIButton) {
        essentialAgree3.toggle()
    }
    @IBAction func didTapChooseAgree(_ sender: UIButton) {
        chooseAgree.toggle()
    }
    
    
    
    
    
    
    
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
        
        
        // 회원가입 버튼 addTarget
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        dismissKeyboardWhenTappedAround()
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
        }else if essentialAgree1 && essentialAgree2 && essentialAgree3 {
            
            let request = SignUpRequest(email: emailTextField.text!, password: passwordTextField.text!, nickname: nickNameTextField.text!)
            SignUpDataManager().postSignUp(request, delegate: self)
        }else {
            presentAlert(title: "필수동의 사항에 체크해주세요.")
        }
    }
}
