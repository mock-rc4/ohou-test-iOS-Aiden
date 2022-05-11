//
//  ChooseProductToReviewVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


final class ChooseProductToReviewVC: BaseViewController {
    
    // 셀 구성할 데이터
    var productInfo: [ProductCellInfoNoRemain] = []
    
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview setting
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "ChooseProductToReviewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ChooseProductToReviewHeader")
        
        // cell
        tableView.register(UINib(nibName: "ChooseProductToReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ChooseProductToReviewTableViewCell")
        
        // API호출
        ReviewProductListDataManager().getReviewProductList(delegate: self)
    }
    
    
    // 탭바 컨트롤
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}


extension ChooseProductToReviewVC: UITableViewDelegate, UITableViewDataSource {
    // 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productInfo.count
    }
    
    // 무슨 셀 사용할지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if productInfo.count >= 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseProductToReviewTableViewCell", for: indexPath) as? ChooseProductToReviewTableViewCell else {
                return UITableViewCell()
            }
            cell.updateCell(productInfo[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    // 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width / 4
    }
    
    
    // 셀 선택
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: - VC modal로 띄우기!, 상품 고유번호 넘겨주기
        guard let reviewVC = storyboard?.instantiateViewController(withIdentifier: "WritingReviewViewController") as? WritingReviewViewController else {
            return
        }
        reviewVC.loadView()
        reviewVC.productID = productInfo[indexPath.row].productId
        reviewVC.updateProductInfo(productInfo[indexPath.row])
        
        self.present(reviewVC, animated: true)
    }
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ChooseProductToReviewHeader") as? ChooseProductToReviewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width / 2.5
    }
}
