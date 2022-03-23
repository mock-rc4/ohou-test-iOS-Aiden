//
//  ProductInfoViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit


class ProductInfoViewController: BaseViewController {
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭바 히든
        self.tabBarController?.tabBar.isHidden = true
        
        
        // tableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "ProductInfoTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProductInfoTableViewHeader")
        
        // cell
//        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}



extension ProductInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
    // MARK: - header
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductInfoTableViewHeader") as? ProductInfoTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 2.4
    }
}
