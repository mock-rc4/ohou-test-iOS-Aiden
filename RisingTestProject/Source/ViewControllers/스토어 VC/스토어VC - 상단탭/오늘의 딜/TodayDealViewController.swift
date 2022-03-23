//
//  TodayDealViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class TodayDealViewController: BaseViewController {
    
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "TodayDealTabHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "TodayDealTabHeader")
        
        // cell
        tableView.register(UINib(nibName: "TodayDealTabCell", bundle: nil), forCellReuseIdentifier: "TodayDealTabCell")
    }
}



extension TodayDealViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Cell 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.todayDealProductInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayDealTabCell", for: indexPath) as? TodayDealTabCell else {
            return UITableViewCell()
        }
        if Constant.todayDealProductInfo.count >= 4 {
            cell.updateCell(Constant.todayDealProductInfo[indexPath.row])
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 0.4
    }
    
    
    
    
    // header설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TodayDealTabHeader") as? TodayDealTabHeader else {
            return UIView()
        }
        return headerView
    }
    // header높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width / 3
    }
}
