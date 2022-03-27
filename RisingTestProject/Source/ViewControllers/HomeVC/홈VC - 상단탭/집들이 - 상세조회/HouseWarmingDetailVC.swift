//
//  HouseWarmingDetailVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


class HouseWarmingDetailVC: BaseViewController {
    
    // 데이터
    var cellTitles: [String] = ["주거형태", "평수", "지역", "가족형태", "작업자"]
    
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell
        tableView.register(UINib(nibName: "HouseWarmingDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "HouseWarmingDetailTableViewCell")
        
        // header
//        tableView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forHeaderFooterViewReuseIdentifier: <#T##String#>)
    }
}



extension HouseWarmingDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HouseWarmingDetailTableViewCell", for: indexPath) as? HouseWarmingDetailTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PopularityTableViewHeader") as? PopularityTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.85
    }
}
