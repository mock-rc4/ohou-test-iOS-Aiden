//
//  TodayDealDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import Alamofire


class TodayDealDataManager {
    
    func getTodayDealProductInfo(delegate: BaseViewController, lastIndex: Int) {
        
        if let todayDealVC = delegate as? TodayDealViewController {
            todayDealVC.fetchingMore = true
        }
        
        
        let url = "\(Constant.baseURL)/store/today-deal/\(lastIndex)"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: TodayDealResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        // MARK: - 성공
                        print("오늘의딜 데이터 가져오기 성공")
                        
                        if let storeHomeVC = delegate as? StoreHomeViewController {
                            Constant.todayDealProductInfo = response.result
                            storeHomeVC.isApiConnectionSuccess[1] = true
                            storeHomeVC.tableView.reloadData()
                        }
                        if let todayDealVC = delegate as? TodayDealViewController {
                            Constant.todayDealProductInfo.append(contentsOf: response.result)
                            todayDealVC.tableView.reloadData()
                            
                            if !response.result.isEmpty {
                                todayDealVC.fetchingMore = false
                            }
                        }
                    }
                    else {
                        switch response.code {
                        case 4000: delegate.presentAlert(title: "데이터베이스 에러")
                        default: print("")
                        }
                    }
                    
                case .failure(let error):
                    print("오늘의 딜 값 가져오기 실패: \(error.localizedDescription)")
                }
            }
    }
}
