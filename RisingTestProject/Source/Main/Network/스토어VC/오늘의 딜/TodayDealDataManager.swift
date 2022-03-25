//
//  TodayDealDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import Alamofire


class TodayDealDataManager {
    
    func getTodayDealProductInfo(delegate: StoreHomeViewController) {
        let url = "\(Constant.baseURL)/store/todayDeal"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: TodayDealResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        // MARK: - 성공
                        print("데이터 가져오기 성공")
                        Constant.todayDealProductInfo = response.result
                        delegate.isApiConnectionSuccess[1] = true
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
