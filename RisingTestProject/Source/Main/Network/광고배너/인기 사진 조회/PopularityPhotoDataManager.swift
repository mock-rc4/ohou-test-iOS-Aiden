//
//  PopularityPhotoDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import Alamofire

final class PopularityPhotoDataManager {
    
    func getPopularityPhoto(delegate: HomePopularityVC) {
        let url = "\(Constant.baseURL)/home/photos"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: PopularityPhotoResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        print("인기 사진 조회 성공")
                        delegate.popularityPhotoList = response.result
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
