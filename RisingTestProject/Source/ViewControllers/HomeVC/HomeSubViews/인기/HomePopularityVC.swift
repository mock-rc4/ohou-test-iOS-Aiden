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
        tableView.register(UINib(nibName: "PopularityPostTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularityPostTableViewCell")
        tableView.register(UINib(nibName: "PopularityTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PopularityTableViewHeader")
        
    }
}



// MARK: - TableView Protocol 채택
extension HomePopularityVC: UITableViewDelegate, UITableViewDataSource {
    
    // 테이블뷰 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath로 구분하여 다른 Cell 반환하기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularityPostTableViewCell", for: indexPath) as? PopularityPostTableViewCell else {
            return UITableViewCell()
        }
        
        // 커스텀 세퍼레이터
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(3.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.systemGray5
        cell.addSubview(additionalSeparator)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 1.6
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
