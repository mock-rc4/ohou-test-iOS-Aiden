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
        tableView.register(UINib(nibName: "SelectAllTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectAllTableViewCell")
        tableView.register(UINib(nibName: "ProductInBasketTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInBasketTableViewCell")
        tableView.register(UINib(nibName: "TotalPriceTableViewCell", bundle: nil), forCellReuseIdentifier: "TotalPriceTableViewCell")
        
        // footer
        tableView.register(UINib(nibName: "BasketTableViewFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "BasketTableViewFooter")
        
        
        // 여백제거
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never
        
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
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
            if section == 1{
                // 장바구니에 담긴 아이템의 개수
                return 3
            }else {
                return 1
            }
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
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAllTableViewCell", for: indexPath) as? SelectAllTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
            else if indexPath.section == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInBasketTableViewCell", for: indexPath) as? ProductInBasketTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell", for: indexPath) as? TotalPriceTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
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
            if indexPath.section == 0 {
                return tableView.frame.width / 9
            }else if indexPath.section == 1 {
                return tableView.frame.width * 0.87
            }else {
                return tableView.frame.width * 0.5
            }
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
            if section == 2 {
                guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BasketTableViewFooter") as? BasketTableViewFooter else {
                    return UIView()
                }
                return footerView
            }else {
                return nil
            }
        }
    }
    
    // Footer 높이값 주기
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return tableView.frame.width / 7
        }else {
            return 0
        }
    }
    
    
    
    
    
    
    // MARK: - TableView 여백 제거
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
}
