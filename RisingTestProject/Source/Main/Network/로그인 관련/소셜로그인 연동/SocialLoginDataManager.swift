//
//  SocialLoginDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/31.
//

import Alamofire


class SocialLoginDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func postSignIn(_ parameters: SocialLoginRequest, delegate: InitialViewController) {

        let url = "\(Constant.baseURL)/oauth"

        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
            .validate()
            .responseDecodable(of: SignUpResponse.self) { response in
                switch response.result {
                // 네트워킹 성공
                case .success(let response):
                    // 로그인 성공
                    if response.isSuccess {
                        print("로그인 성공")
                        delegate.presentAlert(title: "로그인 성공") { _ in
                            guard let rootVC = delegate.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? UITabBarController else {
                                return
                            }
                            // 토큰값 유저디폴트에 저장
                            UserDefaults.standard.set(response.result?.jwt, forKey: "jwt")
                            
                            Constant.isUserLogged = true
                            Constant.accoundID = response.result?.account_Id
                            Constant.jwt = response.result?.jwt
                            delegate.changeRootViewController(rootVC)
                        }
                    }
                    // 회원가입 실패
                    else {
                        // SignInResponse의 프로퍼티 code를 통해 적절한 오류 메시지 주기
                        switch response.code {
                        case 3014: delegate.presentAlert(title: "없는 아이디거나 비밀번호가 틀렸습니다.")
                        case 4011: delegate.presentAlert(title: "비밀번호 암호화에 실패하였습니다.")
                        case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
                        default: print("")
                        }
                    }
                // 네트워킹 실패
                case .failure(let error):
                    print(error.localizedDescription)
                    delegate.presentAlert(title: "서버와의 연결이 좋지 않습니다.")
                }
            }
        
    }
}
