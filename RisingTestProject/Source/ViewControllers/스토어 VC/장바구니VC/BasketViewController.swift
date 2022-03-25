//
//  BasketViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit



class BasketViewController: BaseViewController {
    
    // UI 연결
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        // 장바구니 담기기 전 Cell
        tableView.register(UINib(nibName: "BeforePutInProductTableCell", bundle: nil), forCellReuseIdentifier: "BeforePutInProductTableCell")
        
        // 장바구니 담긴 후 Cell
        
        // footer
    }
}



// MARK: - TableView Protocol
extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell
    // 섹션별 아이템 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 상품이 담기기 전
        if Constant.isProductInBasket == false {
            return 1
        }
        // 상품이 담긴 후
        else {
            return 1
        }
    }
    
    // 사용할 Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 상품이 담기기 전
        if Constant.isProductInBasket == false {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeforePutInProductTableCell", for: indexPath) as? BeforePutInProductTableCell else {
                return UITableViewCell()
            }
            return cell
        }
        // 상품이 담긴 후
        else {
            return UITableViewCell()
        }
    }
    
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        // 상품이 담기기 전
        if Constant.isProductInBasket == false {
            return 1
        }
        // 상품이 담긴 후
        else {
            return 3
        }
    }
    
    // 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 상품이 담기기 전
        if Constant.isProductInBasket == false {
            return tableView.frame.height
        }
        // 상품이 담긴 후
        else {
            return 1
        }
    }
    
    
    
    
    // MARK: - Footer (장바구니에 아이템이 있는지 여부에 따라 footer 생성 여부 결정)
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        // 상품이 담기기 전
        if Constant.isProductInBasket == false {
            return nil
        }
        // 상품이 담긴 후
        else {
            guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PopularityTableViewFooter") as? PopularityTableViewFooter else {
                return UIView()
            }
            return footerView
        }
    }
    // Footer 높이값 주기
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableView.frame.width / 8
    }
}
