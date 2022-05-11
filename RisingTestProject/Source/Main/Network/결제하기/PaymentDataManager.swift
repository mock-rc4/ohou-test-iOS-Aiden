//
//  PaymentDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import Alamofire


final class PaymentDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func payment(_ parameters: PaymentRequest, delegate: PaymentViewController) {

        let url = "\(Constant.baseURL)/store/payment"

        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Constant.jwt ?? "")
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: header)
        .validate()
        .responseDecodable(of: PaymentResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    // 결제 성공
                    print("결제 성공")
                    Constant.didUserOrderProduct = true
                    delegate.presentAlert(title: "결제 성공") { _ in
                        guard let rootVC = delegate.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? UITabBarController else {
                            return
                        }
                        delegate.changeRootViewController(rootVC)
                    }
                }else {
                    // SignInResponse의 프로퍼티 code를 통해 적절한 오류 메시지 주기
                    switch response.code {
                    case 2001: delegate.presentAlert(title: "JWT토큰을 입력해주세요")
                    case 2002: delegate.presentAlert(title: "유효하지 않은 토큰입니다.")
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
                    default: print("")
                    }
                }
            // 네트워킹 실패
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
