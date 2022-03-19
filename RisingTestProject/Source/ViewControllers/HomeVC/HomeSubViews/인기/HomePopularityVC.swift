//
//  HomePopularityVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//


import UIKit

class HomePopularityVC: BaseViewController {
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellReuseIdentifier: <#T##String#>)
        tableView.register(UINib(nibName: "PopularityTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PopularityTableViewHeader")
    }
}



// MARK: - TableView Protocol 채택
extension HomePopularityVC: UITableViewDelegate, UITableViewDataSource {
    
    // 테이블뷰 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    // 테이블뷰 헤더 설정
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
