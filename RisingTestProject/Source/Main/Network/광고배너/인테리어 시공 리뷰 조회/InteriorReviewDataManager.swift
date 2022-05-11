//
//  InteriorReviewDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import Alamofire

final class InteriorReviewDataManager {
    
    func getInteriorReview(delegate: HomePopularityVC) {
        let url = "\(Constant.baseURL)/home/reviews"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: InteriorReviewResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        print("인테리어 시공 리뷰 조회 성공")
                        delegate.interiorReviewPost = response.result
                        delegate.tableView.reloadData()
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
}
