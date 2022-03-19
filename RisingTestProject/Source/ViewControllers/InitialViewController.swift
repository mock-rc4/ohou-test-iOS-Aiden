//
//  InitialViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit


class InitialViewController: BaseViewController {
    
    // MARK: - UI 연결
    
    // 로그인하지 않고 메인화면으로 넘어가기
    @IBAction func didTapLookAroundButton(_ sender: Any) {
        Constant.isUserTapLookAroundButton = true
        self.dismiss(animated: true)
    }
    
    // 카카오 로그인 버튼
    @IBAction func didTapKakaoLoginButton(_ sender: UIButton) {
    }
    
    // 네이버 로그인 버튼
    @IBAction func didTapNaverLoginButton(_ sender: UIButton) {
    }
    
    // 이메일로 로그인 & 이메일로 가입 버튼
    // underline줘야되서 addTarget으로 액션 부여
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var signUpByEmailButton: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 Text에 underLine작업
        emailLoginButton.addUnderLine()
        signUpByEmailButton.addUnderLine()
    }
}
