//
//  PutInBasketDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import Alamofire

class PutInBasketDataManager {
    
    func putInBasket(_ param: PutInBasketRequest, delegate: ProductOptionViewController) {
        
        let url = "\(Constant.baseURL)/store/baskets"
        
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Constant.jwt ?? "")
        
        AF.request(url,
                   method: .post,
                   parameters: param,
                   encoder: JSONParameterEncoder(),
                   headers: header)
        .validate()
        .responseDecodable(of: PutInBasketResponse.self) { response in
            switch response.result {
            // 네트워킹 성공
            case .success(let response):
                // 프로필 변경 성공
                if response.isSuccess {
                    print("장바구니 담기 성공")
                    delegate.presentAlert(title: "장바구니에 상품이 담겼습니다.") { _ in
                        delegate.dismiss(animated: true)
                    }
                }
                // 프로필 변경 실패
                else {
                    // SignInResponse의 프로퍼티 code를 통해 적절한 오류 메시지 주기
                    switch response.code {
                    case 2001: delegate.presentAlert(title: "로그인 상태가 아닙니다.")
                    case 2002: delegate.presentAlert(title: "유효하지 않은 JWT입니다. 로그인을 다시 해주세요.")
                    case 2019: delegate.presentAlert(title: "상품 고유번호를 입력해주세요.")
                    case 2020: delegate.presentAlert(title: "장바구니에 담을 상품 개수를 입력해주세요.")
                    case 2021: delegate.presentAlert(title: "이미 장바구니에 존재하는 상품입니다.") { _ in
                        delegate.dismiss(animated: true)
                    }
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
