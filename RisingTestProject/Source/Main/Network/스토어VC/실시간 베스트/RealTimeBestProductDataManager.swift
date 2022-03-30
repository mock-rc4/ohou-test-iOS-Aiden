//
//  RealTimeBestProductDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import Alamofire

class RealTimeBestProductDataManager {
    
    func getBestProduct(delegate: StoreBestViewController, lastIndex: Int) {
        delegate.fetchingMore = true
        
        let url = "\(Constant.baseURL)/store/best/\(lastIndex)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil)
        .responseDecodable(of: RealTimeBestProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("실시간 베스트 조회 성공")
                    
                    if lastIndex == 0 {
                        delegate.realTimeBestProductInfo = response.result
                    }else {
                        delegate.realTimeBestProductInfo.append(contentsOf: response.result)
                    }
                    
                    delegate.tableView.reloadData()
                    
                }else {
                    switch response.code {
                    case 2600: delegate.presentAlert(title: "no(index)를 입력해주세요.")
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
                    default: print("")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                delegate.presentAlert(title: "네트워크 상태가 좋지 않습니다.")
            }
        }
        
//        delegate.dismissIndicator()
        delegate.fetchingMore = false
    }
}
