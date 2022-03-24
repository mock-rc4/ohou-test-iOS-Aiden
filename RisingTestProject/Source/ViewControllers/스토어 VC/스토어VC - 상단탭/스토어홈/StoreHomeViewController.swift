//
//  StoreHomeViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class StoreHomeViewController: BaseViewController {
    
    // API가 성공하면 값을 true로 변경 -> 모든 API가 연결되면 테이블뷰를 리로드
    var isApiConnectionSuccess: [Bool] = [false, false, false, false, false] {
        didSet {
            if isApiConnectionSuccess.allSatisfy({$0}) {
                tableView.reloadData()
            }
        }
    }
    
    // API로 받아오는 데이터
    var popularKeywords: [PopularKeyword] = []
    
    
    // MARK: - UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 세팅
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never

        
        // header
        tableView.register(UINib(nibName: "StoreHomeTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreHomeTableViewHeader")
        
        // cell
        tableView.register(UINib(nibName: "StoreTodayDealTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreTodayDealTableViewCell")
        tableView.register(UINib(nibName: "RecommendedProductTableViewCell", bundle: nil), forCellReuseIdentifier: "RecommendedProductTableViewCell")
        tableView.register(UINib(nibName: "PopularKeywordTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularKeywordTableViewCell")
        tableView.register(UINib(nibName: "PopularProductTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularProductTableViewCell")
        
        
        // MARK: - API
        // 광고 이미지 API 호출
        CommercialImageDataManager().getBannerImage(CommercialImageRequest(location: "store"), delegate: self)
        
        // 오늘의딜 API 호출
        TodayDealDataManager().getTodayDealProductInfo(delegate: self)
        
        // 인기키워드 API 호출
        PopularKeywordDataManager().getPopularKeyword(delegate: self)
        
        // 내가본 상품과 연관상품 API 호출
        RelatedProductUserSawDataManager().getRelatedProduct(delegate: self)
        
        // 추천상품 API 호출
        RecommendProductDataManager().getRecommendProduct(delegate: self)
    }
}




// MARK: - TableView Protocol 채택
extension StoreHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 테이블뷰 Cell 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    // Cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTodayDealTableViewCell", for: indexPath) as? StoreTodayDealTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            // View 전환 delegate
            cell.delegate = self
            if Constant.todayDealProductInfo.count >= 4 {
                cell.collectionView.reloadData()
            }
            return cell
        }
        else if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedProductTableViewCell", for: indexPath) as? RecommendedProductTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            cell.headerTitle = "내가 본 상품의 연관 상품"
            if Constant.relatedUserSawProductInfo.count >= 1 {
                cell.collectionView.reloadData()
            }
            return cell
        }
        else if indexPath.row == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedProductTableViewCell", for: indexPath) as? RecommendedProductTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            cell.headerTitle = "\(Constant.userInfo?.nickname ?? "")님을 위한 추천상품"
            if Constant.recommendProductInfo.count >= 1 {
                cell.collectionView.reloadData()
            }
            return cell
        }
        else if indexPath.row == 3{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedProductTableViewCell", for: indexPath) as? RecommendedProductTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
        else if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularKeywordTableViewCell", for: indexPath) as? PopularKeywordTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            if isApiConnectionSuccess[2] == true {
                cell.updateCell(popularKeywords)
            }
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularProductTableViewCell", for: indexPath) as? PopularProductTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.frame.width * 2.2
        }else if indexPath.row <= 3 {
            return tableView.frame.width * 1.1
        }else if indexPath.row == 4{
            return tableView.frame.width * 0.75
        }else {
            // 인기상품 Cell 높이 조절 필요
            // 4 = 보여줄 상품 개수 / 2 = 높이 계산할 Cell 개수
            return (tableView.frame.width / 7) + ((tableView.frame.width * 0.93) * 4)
        }
    }
    
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreHomeTableViewHeader") as? StoreHomeTableViewHeader else {
            return UIView()
        }
        headerView.imageArray = Constant.storeViewBannerImage
        headerView.collectionView.reloadData()
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 2.1
    }
}




// MARK: - View전환 프로토콜 채택
extension StoreHomeViewController: ShowProductDetailPage {
    func showDetailPage() {
        guard let productInfoVC = storyboard?.instantiateViewController(withIdentifier: "ProductInfoViewController") as? ProductInfoViewController else{
            return
        }
        self.navigationController?.pushViewController(productInfoVC, animated: true)
    }
    
}
