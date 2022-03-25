//
//  RealTimeBestProductDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import Alamofire

class RealTimeBestProductDataManager {
    
    // delegate VC 변경 !!!!!
    func getBestProduct(delegate: StoreHomeViewController) {
        let url = "\(Constant.baseURL)/store/best"
        
        AF.request(url,
                   method: .get,
                   parameters: nil)
        .responseDecodable(of: RealTimeBestProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("데이터 가져오기 성공")
//                    Constant.popularProductInfo = response.result
//                    delegate.isApiConnectionSuccess[5] = true
                }else {
                    switch response.code {
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
                    default: print("")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                delegate.presentAlert(title: "네트워크 상태가 좋지 않습니다.")
            }
        }
    }
}
