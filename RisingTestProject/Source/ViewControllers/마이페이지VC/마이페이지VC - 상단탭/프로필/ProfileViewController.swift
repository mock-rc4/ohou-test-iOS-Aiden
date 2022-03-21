//
//  ProfileViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProfileTableViewHeader")
        
        tableView.register(UINib(nibName: "MyShoppingTableViewCell", bundle: nil), forCellReuseIdentifier: "MyShoppingTableViewCell")
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
    }
}



// MARK: - tableview Protocol 채택
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // 나의 쇼핑
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyShoppingTableViewCell", for: indexPath) as? MyShoppingTableViewCell else {
                return UITableViewCell()
            }
            cell.updateCell(0, coupon: 0, point: 0)
            return cell
            
        }else if indexPath.row == 1 {
            // 사진
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        }else if indexPath.row == 1 {
            // 광고
            return UITableViewCell()
        }else {
            // 일반 셀
            return UITableViewCell()
        }
    }
    
    
    
    // 테이블뷰 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            // 나의 쇼핑
            return tableView.frame.width * 0.45
        }else if indexPath.row == 1 {
            // 사진
            return tableView.frame.width * 1.4
        }else if indexPath.row == 1 {
            // 광고
            return 100
        }else {
            // 일반 셀
            return 100
        }
    }
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableViewHeader") as? ProfileTableViewHeader else {
            return UIView()
        }

        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.6
    }
}
