//
//  ExhibitionDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import Alamofire


class ExhibitionDataManager {
    
    func getExhibitionList(delegate: HomePopularityVC) {
        let url = "\(Constant.baseURL)/home/exhibition"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: ExhibitionResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        print("기획전 조회 성공")
                        delegate.exhibitionList = response.result
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
