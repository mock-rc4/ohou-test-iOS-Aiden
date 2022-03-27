//
//  HomeFollowingVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit


class HomeFollowingVC: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // tableview 데이터
    var followingPost: [FollowingPost] = []
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview setting
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell
        tableView.register(UINib(nibName: "HomeFollowingTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeFollowingTableViewCell")
        
        // header
        tableView.register(UINib(nibName: "HomeFollowingTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeFollowingTableViewHeader")
        
        // API 호출
        HomeFollowingDataManager().getFollowingPost(delegate: self)
    }
}


extension HomeFollowingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followingPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFollowingTableViewCell", for: indexPath) as? HomeFollowingTableViewCell else {
            return UITableViewCell()
        }
        addSeparator(cell)
        cell.selectionStyle = .none
        if followingPost.count >= 1 {
            cell.updateCell(followingPost[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 1.43
    }
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeFollowingTableViewHeader") as? HomeFollowingTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.3
        
    }
}
