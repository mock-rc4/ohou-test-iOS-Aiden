//
//  AutoLoginDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//

import Alamofire


class AutoLoginDataManager {
    
    func jwtCheck() {
        let url = "\(Constant.baseURL)/app/accounts/auto-login"
        
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Constant.jwt ?? "")
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .responseDecodable(of: AutoLoginResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("자동로그인 성공")
                    Constant.isUserLogged = true
                    Constant.accoundID = response.result?.accountId
                    
                }else {
                    switch response.code {
                    case 2001: print("토큰이 입력되지 않았습니다.")
                    case 2002: print("유효하지 않은 토큰입니다.")
                    case 4000: print("데이터베이스 에러")
                    default: UserDefaults.standard.set("", forKey: "jwt")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("자동로그인 네트워킹 실패")
            }
        }
        
        // jwt토큰 유효성 검사가 끝나면 세마포어 시그널
        Constant.semaphore.signal()
    }
}
