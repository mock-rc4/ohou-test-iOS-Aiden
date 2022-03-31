//
//  StoreBestViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class StoreBestViewController: BaseViewController {
    
    // 무한스크롤 컨트롤
    var fetchingMore: Bool = false
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // API로 받아올 데이터
    var realTimeBestProductInfo: [ProductCellInfoNoRemain] = []
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "StoreBestTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "StoreBestTableViewHeader")
        
        // cell
        tableView.register(UINib(nibName: "RealTimeBestTableViewCell", bundle: nil), forCellReuseIdentifier: "RealTimeBestTableViewCell")
        
        // API호출
        RealTimeBestProductDataManager().getBestProduct(delegate: self, lastIndex: realTimeBestProductInfo.count)
    }
}


// MARK: - TableView Protocol 채택
extension StoreBestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realTimeBestProductInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeBestTableViewCell", for: indexPath) as? RealTimeBestTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        if realTimeBestProductInfo.count >= 1 {
            cell.updateCell(realTimeBestProductInfo[indexPath.row], rank: indexPath.row+1)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width / 2
    }
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "StoreBestTableViewHeader") as? StoreBestTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width / 6
    }
}





// MARK: - 무한스크롤
extension StoreBestViewController {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.contentOffset.y > (tableView.contentSize.height - tableView.bounds.size.height) {
            
            if !fetchingMore {
                print("마지막에 도달")
                RealTimeBestProductDataManager().getBestProduct(delegate: self, lastIndex: realTimeBestProductInfo.count)
//                showIndicator()
            }
        }
    }
}
