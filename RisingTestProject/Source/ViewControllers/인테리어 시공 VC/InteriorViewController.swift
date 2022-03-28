//
//  InteriorViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


class InteriorViewController: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var forRadiusView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tempView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRadiusToUIView(forRadiusView, size: forRadiusView.frame.height / 5)
        
        // table view setting
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "InteriorTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "InteriorTableViewHeader")
        
        // cell
//        tableView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellReuseIdentifier: <#T##String#>)
    }
}



extension InteriorViewController: UITableViewDelegate, UITableViewDataSource {
    
    // cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InteriorTableViewHeader") as? InteriorTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.85
    }
}
