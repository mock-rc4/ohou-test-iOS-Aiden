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
        tableView.register(UINib(nibName: "MainCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCategoryTableViewCell")
        
    }
}



// MARK: - TableView Protocol 채택
extension HomePopularityVC: UITableViewDelegate, UITableViewDataSource {
    
    // 테이블뷰 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath로 구분하여 다른 Cell 반환하기
        if indexPath.row <= 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularityPostTableViewCell", for: indexPath) as? PopularityPostTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCategoryTableViewCell", for: indexPath) as? MainCategoryTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
    }
    
    
    
    // 테이블뷰 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 2 {
            return tableView.frame.width * 1.6
        }else {
            return tableView.frame.width / 1.8
        }
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






// MARK: - Cell 구분선 커스텀
extension HomePopularityVC {
    func addSeparator(_ cell: UITableViewCell) {
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(5.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.systemGray5
        cell.addSubview(additionalSeparator)
    }
}
