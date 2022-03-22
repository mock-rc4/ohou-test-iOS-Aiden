//
//  ModifyProfileDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import Alamofire

class ModifyProfileDataManager {
    
    func modifyProtile(_ param: ModifyProfileRequest, delegate: ModifyProfileViewController) {
        
        let url = "\(Constant.baseURL)/app/accounts"
        
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Constant.jwt ?? "")
        
        AF.request(url,
                   method: .patch,
                   parameters: param,
                   encoder: JSONParameterEncoder(),
                   headers: header)
        .validate()
        .responseDecodable(of: ModifyProfileResponse.self) { response in
            switch response.result {
            // 네트워킹 성공
            case .success(let response):
                // 프로필 변경 성공
                if response.isSuccess {
                    print("프로필 변경 성공")
                    delegate.presentAlert(title: "프로필이 변경되었습니다.") { _ in
                        delegate.navigationController?.popViewController(animated: true)
                    }
                }
                // 프로필 변경 실패
                else {
                    // SignInResponse의 프로퍼티 code를 통해 적절한 오류 메시지 주기
                    switch response.code {
                    case 2001: delegate.presentAlert(title: "로그인 상태가 아닙니다.")
                    case 2002: delegate.presentAlert(title: "유효하지 않은 JWT입니다. 로그인을 다시 해주세요.")
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
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
