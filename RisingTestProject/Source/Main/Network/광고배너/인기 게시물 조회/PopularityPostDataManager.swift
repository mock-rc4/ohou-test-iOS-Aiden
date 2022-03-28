//
//  PopularityPostDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import Alamofire

class PopularityPostDataManager {
    
    func getPopularityPost(delegate: HomePopularityVC) {
        let url = "\(Constant.baseURL)/home"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: PopularityPostResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        print("인기 게시글 조회 성공")
                        
                        delegate.popularityPostList1 = Array(response.result[0...3])
                        delegate.popularityPostList2 = Array(response.result[4...7])
                        delegate.popularityPostList3 = Array(response.result[8...11])
                        
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
