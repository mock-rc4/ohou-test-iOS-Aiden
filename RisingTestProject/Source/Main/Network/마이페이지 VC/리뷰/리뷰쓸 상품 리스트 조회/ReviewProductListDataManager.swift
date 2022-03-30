//
//  ReviewProductListDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import Alamofire


class ReviewProductListDataManager {
    
    func getReviewProductList(delegate: ChooseProductToReviewVC) {
        let url = "\(Constant.baseURL)/store/popular-products"
        
        AF.request(url,
                   method: .get,
                   parameters: nil)
        .responseDecodable(of: PopularProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("데이터 가져오기 성공")
                    delegate.productInfo = response.result
                    delegate.tableView.reloadData()
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
                delegate.presentAlert(title: "네트워크 상태가 좋지 않습니다.")
            }
        }
    }
}
