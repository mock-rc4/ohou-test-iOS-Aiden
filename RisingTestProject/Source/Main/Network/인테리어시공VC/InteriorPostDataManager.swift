//
//  InteriorPostDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//

import Alamofire


class InteriorPostDataManager {
    
    func getInteriorPost(delegate: InteriorViewController) {
        let url = "\(Constant.baseURL)/Interior"
        
        AF.request(url,
                   method: .get,
                   parameters: nil)
        .responseDecodable(of: InteriorPostResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("인테리어시공 게시글 리스트 조회 성공")
                    delegate.interiorPost = response.result
                    delegate.tableView.reloadData()
                }else {
                    switch response.code {
                    case 4000: delegate.presentAlert(title: "데이터베이스 에러.")
                    default: print("")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                delegate.presentAlert(title: "네트워크 상태가 좋지 않습니다.(인테리어 시공)")
            }
        }
    }
}
