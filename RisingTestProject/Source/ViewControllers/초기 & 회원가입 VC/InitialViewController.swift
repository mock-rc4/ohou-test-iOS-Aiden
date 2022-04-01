//
//  InitialViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit
import NaverThirdPartyLogin
import Alamofire


class InitialViewController: BaseViewController {
    
    // MARK: - UI 연결
    
    // 로그인하지 않고 메인화면으로 넘어가기
    @IBAction func didTapLookAroundButton(_ sender: Any) {
        // Alert
        let lookAround: UIAlertAction = UIAlertAction(title: "둘러보기", style: .default) { _ in
            Constant.isUserTapLookAroundButton = true
            Constant.isUserLogged = false
            self.dismiss(animated: true)
        }
        let signInNow: UIAlertAction = UIAlertAction(title: "지금 가입하기", style: .default) { _ in
            print("지금 가입하기 버튼 클릭")
        }
        presentAlert(title: "첫 구매 최대 100,000원 할인", message: "지금 가입하면 바로 사용 가능한\n최대 10만원 쿠폰팩을 드립니다.", isCancelActionIncluded: false, preferredStyle: .alert, with: lookAround, signInNow)
    }
    
    // 카카오 로그인 버튼
    @IBAction func didTapKakaoLoginButton(_ sender: UIButton) {
        KakaoLoginManager().kakaoLogin(self)
    }
    
    
    // 네이버 로그인 버튼
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    @IBAction func didTapNaverLoginButton(_ sender: UIButton) {
        naverLoginInstance?.requestThirdPartyLogin()
    }
    
    
    
    // 이메일로 로그인 & 이메일로 가입 버튼
    // underline줘야되서 addTarget으로 액션 부여
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var signUpByEmailButton: UIButton!
    
    
    
    @IBAction func didTapappleLoginButton(_ sender: UIButton) {
        presentAlert(title: "서비스 준비중입니다.")
    }
    @IBAction func didTapFacebookLoginButton(_ sender: UIButton) {
        presentAlert(title: "서비스 준비중입니다.")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 Text에 underLine작업
        emailLoginButton.addUnderLine()
        signUpByEmailButton.addUnderLine()
        
        
        // 이메일로 회원가입 버튼 addTarget
        signUpByEmailButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        // 이메일로 로그인하기 버튼 addTarget
        emailLoginButton.addTarget(self, action: #selector(didTapEmailLoginButton), for: .touchUpInside)
        
        // 네이버 로그인 인스턴스 delegate설정
        naverLoginInstance?.delegate = self
    }
    
    
    
    // MARK: - objc함수
    
    // 회원가입 버튼
    @objc func didTapSignUpButton() {
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {
            return
        }
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // 로그인 버튼
    @objc func didTapEmailLoginButton() {
        guard let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else {
            return
        }
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
}




// MARK: - 네이버 로그인
extension InitialViewController: NaverThirdPartyLoginConnectionDelegate {
    
    // 로그인에 성공하면 호출되는 함수
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("네이버 로그인 성공")
        if let loginInstance = naverLoginInstance {
            NaverLoginDataManager().naverLoginPaser(self, loginInstance: loginInstance)
        }
    }
    
    // 접근 토큰을 갱신할 때 호출되는 함수
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("네이버 토큰: \(naverLoginInstance?.accessToken ?? "")")
    }
    
    // 토큰을 삭제하면 호출되는 함수 (로그아웃에 사용)
    func oauth20ConnectionDidFinishDeleteToken() {
        print("네이버 로그아웃")
    }
    
    // 네이버로 로그인하는 과정에서 발생하는 모든 에러에 호출되는 함수
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("에러 = \(error.localizedDescription)")
    }
}
