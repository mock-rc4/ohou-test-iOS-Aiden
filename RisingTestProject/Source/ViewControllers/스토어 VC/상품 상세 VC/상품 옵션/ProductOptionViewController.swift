//
//  ProductOptionViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit



class ProductOptionViewController: BaseViewController {
    
    // 옵션 데이터
    var optionCellArray: [String] = []
    
    
    
    // UI연결
    @IBOutlet weak var optionTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView 세팅
        optionTableView.delegate = self
        optionTableView.dataSource = self
        
        // footer
        optionTableView.register(UINib(nibName: "BottomSheetTableViewFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "BottomSheetTableViewFooter")
        
        // cell
        optionTableView.register(UINib(nibName: "BottomSheetTableViewCell", bundle: nil), forCellReuseIdentifier: "BottomSheetTableViewCell")
        
        
    }
}



extension ProductOptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionCellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BottomSheetTableViewCell", for: indexPath) as? BottomSheetTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.updateCell(optionCellArray[indexPath.row])
        return cell
    }
    
    // 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    
    // 테이블뷰 Footer 설정
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BottomSheetTableViewFooter") as? BottomSheetTableViewFooter else {
            return UIView()
        }
        return footerView
    }
    // Footer 높이값 주기
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.7
    }
}
