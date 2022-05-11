//
//  NaverLoginDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/04/01.
//

import NaverThirdPartyLogin
import Alamofire

final class NaverLoginDataManager {
    
    func naverLoginPaser(_ delegate: InitialViewController, loginInstance: NaverThirdPartyLoginConnection) {
        
        let accessToken = loginInstance.isValidAccessTokenExpireTimeNow()
        
        if !accessToken {
            return
        }
        
        guard let tokenType = loginInstance.tokenType else {return}
        guard let accessToken = loginInstance.accessToken else {return}
        
        let requestUrl = "https://openapi.naver.com/v1/nid/me"
        let url: URL = URL(string: requestUrl)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url,
                             method: .get,
                             parameters: nil,
                             encoding: JSONEncoding.default,
                             headers: ["Authorization": authorization])
            .responseJSON { (response) in
                guard let body = response.value as? [String: Any] else {return}
                
                if let resultCode = body["message"] as? String {
                    if resultCode.trimmingCharacters(in: .whitespaces) == "success" {
                        let resultJson = body["response"] as! [String: Any]
                        
                        let name = resultJson["name"] as? String ?? ""
                        let id = resultJson["id"] as? String ?? ""
                        let phone = resultJson["mobile"] as? String ?? ""
                        let gender = resultJson["gender"] as? String ?? ""
                        let birthyear = resultJson["birthyear"] as? String ?? ""
                        let birthday = resultJson["birthday"] as? String ?? ""
                        let profile = resultJson["profile_image"] as? String ?? ""
                        let email = resultJson["email"] as? String ?? ""
                        let nickName = resultJson["nickname"] as? String ?? ""
                        
                        print("네이버 로그인 이름 ",name)
                        print("네이버 로그인 아이디 ",id)
                        print("네이버 로그인 핸드폰 ",phone)
                        print("네이버 로그인 성별 ",gender)
                        print("네이버 로그인 생년 ",birthyear)
                        print("네이버 로그인 생일 ",birthday)
                        print("네이버 로그인 프로필사진 ",profile)
                        print("네이버 로그인 이메일 ",email)
                        print("네이버 로그인 닉네임 ",nickName)
                        
                        delegate.presentAlert(title: "로그인 성공") { _ in
                            guard let rootVC = delegate.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? UITabBarController else {
                                return
                            }
                            // 토큰값 유저디폴트에 저장
//                            UserDefaults.standard.set(response.result?.jwt, forKey: "jwt")
                            
                            Constant.isUserLogged = true
//                            Constant.accoundID = response.result?.account_Id
//                            Constant.jwt = response.result?.jwt
                            delegate.changeRootViewController(rootVC)
                        }
                        
                    }
                    else {
                        print("네이버 로그인 실패")
                    }
                }
            }

    }
}
