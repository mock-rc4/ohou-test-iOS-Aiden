//
//  ProductInfoViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit
import MaterialComponents


class ProductInfoViewController: BaseViewController {
    
    // 해당 상품 옵션 정보
    var productOption: [String] = [
        "사이즈선택",
        "색상선택",
        "추가 상품(선택)"
    ]
    
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    // 뒤로가기 버튼
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // 구매하기 버튼 클릭
    @IBAction func didTapPurchaseButton(_ sender: UIButton) {
        guard let optionVC = storyboard?.instantiateViewController(withIdentifier: "ProductOptionViewController") as? ProductOptionViewController else {
            return
        }
        optionVC.optionCellArray = productOption
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: optionVC)
        
        // bottomsheet의 높이를 100(여유) + 옵션 수 * 40으로 설정
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = CGFloat(100 + (productOption.count * 40))
        present(bottomSheet, animated: true)
    }
    
    
    
    
    // MARK: - View Did Load
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
        tableView.register(UINib(nibName: "UserStylingTableViewCell", bundle: nil), forCellReuseIdentifier: "UserStylingTableViewCell")
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
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserStylingTableViewCell", for: indexPath) as? UserStylingTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.frame.width * 1.2
        }else {
            return 50
        }
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
