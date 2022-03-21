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
    
    
    // 기본 셀 정보 데이터
    var cellTitleArray: [String] = [
        "스크랩북",
        "집들이",
        "노하우",
        "질문과답변",
        "리뷰쓰기",
        "리뷰",
        "인테리어시공 상담내역",
        "고객센터"
    ]
    var cellCountArray: [String] = [
        "0", "0", "0", "", "", "0", "0", ""
    ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProfileTableViewHeader")
        
        tableView.register(UINib(nibName: "MyShoppingTableViewCell", bundle: nil), forCellReuseIdentifier: "MyShoppingTableViewCell")
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        tableView.register(UINib(nibName: "CommercialTableViewCell", bundle: nil), forCellReuseIdentifier: "CommercialTableViewCell")
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
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
            
        }else if indexPath.row == 2 {
            // 광고
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommercialTableViewCell", for: indexPath) as? CommercialTableViewCell else {
                return UITableViewCell()
            }
            return cell
            
        }else {
            // 일반 셀
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.updateCell(cellTitleArray[indexPath.row-3], count: cellCountArray[indexPath.row-3])
            return cell
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
        }else if indexPath.row == 2 {
            // 광고
            return tableView.frame.width / 2.6
        }else {
            // 일반 셀
            return 50
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
