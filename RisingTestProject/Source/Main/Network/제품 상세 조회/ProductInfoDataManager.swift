//
//  ProductInfoDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import Alamofire


class ProductInfoDataManager {
    
    func getProductInfo(_ parameters: ProductInfoRequest, delegate: ProductInfoViewController) {
        
        let url = "\(Constant.baseURL)/store/products/\(parameters.productId)"
        
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
        .responseDecodable(of: ProductInfoResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    
                    // MARK: - 성공
                    print("데이터 가져오기 성공")
                    
                    if !response.result.isEmpty {
                        delegate.productDetail = response.result[0]
                        delegate.productInfoImageArray = self.returnUrlString(response.result[0])
                        delegate.tableView.reloadData()
                    }
                }
                else {
                    switch response.code {
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러")
                    default: print("")
                    }
                }
                
            case .failure(let error):
                print("값 가져오기 실패: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    // 제품 이미지 urlString 반환
    func returnUrlString(_ data: ProductDetail) -> [String] {
        var result: [String] = []
        if !data.productImg2.isEmpty {
            result.append(data.productImg2)
        }
        if !data.productImg3.isEmpty {
            result.append(data.productImg3)
        }
        if !data.productImg4.isEmpty {
            result.append(data.productImg4)
        }
        if !data.productImg5.isEmpty {
            result.append(data.productImg5)
        }
        if !data.productImg6.isEmpty {
            result.append(data.productImg6)
        }
        if !data.productImg7.isEmpty {
            result.append(data.productImg7)
        }
        if !data.productImg8.isEmpty {
            result.append(data.productImg8)
        }
        return result
    }
}
