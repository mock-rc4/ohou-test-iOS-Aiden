//
//  RecommendProductDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import Alamofire


final class RecommendProductDataManager {
    
    func getRecommendProduct(delegate: StoreHomeViewController) {
        let url = "\(Constant.baseURL)/store/recommendation"
        
        var header = HTTPHeaders()
        header.add(name: "X-ACCESS-TOKEN", value: Constant.jwt ?? "")
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .responseDecodable(of: RecommendProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("데이터 가져오기 성공")
                    Constant.recommendProductInfo = response.result
                    delegate.isApiConnectionSuccess[4] = true
                }else {
                    switch response.code {
                    case 2001: delegate.presentAlert(title: "JWT가 입력되지 않았습니다.")
                    case 2002: delegate.presentAlert(title: "유효하지 않은 JWT입니다..")
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러")
                    default: print("")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                delegate.presentAlert(title: "네트워크 상태가 좋지 않습니다. (추천상품)")
            }
        }
    }
}
