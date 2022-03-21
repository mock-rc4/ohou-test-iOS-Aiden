//
//  SignInDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import Alamofire

class SignUpDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func postSignUp(_ parameters: SignUpRequest, delegate: SignUpViewController) {

        let url = "\(Constant.baseURL)/app/accounts/join"

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
                    // 회원가입 성공
                    if response.isSuccess {
                        print("회원가입 성공")
                        delegate.presentAlert(title: "회원가입이 완료되었습니다.") { _ in
                            delegate.navigationController?.popViewController(animated: true)
                        }
                    }
                    // 회원가입 실패
                    else {
                        // SignInResponse의 프로퍼티 code를 통해 적절한 오류 메시지 주기
                        switch response.code {
                        case 2015: delegate.presentAlert(title: "이메일을 입력해주세요.")
                        case 2016: delegate.presentAlert(title: "이메일 형식을 확인해주세요.")
                        case 4000: delegate.presentAlert(title: "데이터데이스 에러.")
                        case 4012: delegate.presentAlert(title: "비밀번호 복호화에 실패하였습니다.")
                        default: print("")
                        }
                    }
                // 네트워킹 실패
                case .failure(let error):
                    delegate.presentAlert(title: "서버와의 연결이 좋지 않습니다.")
                }
            }
        
    }
}
