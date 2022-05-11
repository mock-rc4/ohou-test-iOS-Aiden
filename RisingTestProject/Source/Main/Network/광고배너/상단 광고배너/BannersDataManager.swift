//
//  BannersDataManager.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//


import Alamofire

final class BannersDataManager {
    
    var urlImages: [UIImage] = []
    
    func getBannerImage(delegate: HomePopularityVC) {
        let url = "\(Constant.baseURL)/app/banners"
        
        AF.request(url,
                   method: .get,
                   headers: nil)
            .responseDecodable(of: BannersResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        
                        // MARK: - 성공
                        print("데이터 가져오기 성공")
                        
                        // url string 배열
                        let urlString: [String] = response.result.map({
                            $0.banner_Img
                        })
                        
                        // url(string) -> UIImage로 변환하는 함수
                        self.urlToUIimage(urlString, completion: {
                            Constant.interiorBannerImage = self.urlImages
                            delegate.bannerImage = self.urlImages
                            delegate.tableView.reloadData()
                        })
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
    
    
    func urlToUIimage(_ urls: [String], completion: @escaping()-> ()) {
        urls.forEach({
            let url = URL(string: $0)
            let data = try? Data(contentsOf: url!)
            urlImages.append(UIImage(data: data!)!)
        })
        completion()
    }
    
}
