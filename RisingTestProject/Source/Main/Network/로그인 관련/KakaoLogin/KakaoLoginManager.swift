//
//  KakaoLoginManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser


class KakaoLoginManager {
    
    static var userNickName: String?
    static var userEmail: String?
    
    func kakaoLogin(_ delegate: InitialViewController) {
        // 카톡이 깔려있는지 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카톡이 있는 경우
            UserApi.shared.loginWithKakaoTalk { (OAuthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    // MARK: - 여기서 access토큰을 사용하여 서버와 API (post)통신!
                    SocialLoginDataManager().postSignIn(SocialLoginRequest(accessToken: OAuthToken?.accessToken ?? "", type: "kakao"), delegate: delegate)
                    
                    self.setUserInfo()
                }
            }
        }
        // 카톡이 없는 경우
        else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
               if let error = error {
                 print(error)
               }
               else {
                   print("loginWithKakaoAccount() success.")
                
                   
                   // MARK: - 여기서 access토큰을 사용하여 서버와 API (post)통신!
                   SocialLoginDataManager().postSignIn(SocialLoginRequest(accessToken: oauthToken?.accessToken ?? "", type: "kakao"), delegate: delegate)
                   
                   self.setUserInfo()
                   
               }
            }
        }
    }
    
    // kakao 유저 정보 활용
    func setUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                print(error)
            }else {
                print("me() success.")
                
                // 유저정보 Static 변수에 저장
                KakaoLoginManager.userNickName = user?.kakaoAccount?.profile?.nickname ?? ""
                KakaoLoginManager.userEmail = user?.kakaoAccount?.email ?? ""
                
            }
        }
    }
    
    // kakao 로그아웃
    func kakaoLogout() {
        UserApi.shared.logout { (error) in
            if let error = error {
                print(error)
            }else {
                print("logout() success")
            }
        }
    }
}
