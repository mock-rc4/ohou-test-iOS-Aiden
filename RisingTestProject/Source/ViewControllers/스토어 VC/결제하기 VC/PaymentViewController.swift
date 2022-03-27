//
//  PaymentViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//

import UIKit

class PaymentViewController: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // tableview 세팅
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell
        tableView.register(UINib(nibName: "DeliveryAddressTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryAddressTableViewCell")
        tableView.register(UINib(nibName: "OrdererTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdererTableViewCell")
        tableView.register(UINib(nibName: "OrderProductTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderProductTableViewCell")
        tableView.register(UINib(nibName: "PaymentMethodTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentMethodTableViewCell")
        
        // footer
//        tableView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forHeaderFooterViewReuseIdentifier: <#T##String#>)
    }
}



// MARK: - TableView Protocol 채택
extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - Cell
    // 섹션별 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            // 주문제품의 수
            return 2
        }else {
            return 1
        }
    }

    
    // 사용할 cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 배송지 cell
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCell", for: indexPath) as? DeliveryAddressTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
        // 주문자 cell
        else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrdererTableViewCell", for: indexPath) as? OrdererTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
        // 주문상품 cell
        else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrderProductTableViewCell", for: indexPath) as? OrderProductTableViewCell else {
                return UITableViewCell()
            }
//            addSeparator(cell)
            return cell
        }
        // 결제수단 cell
        else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodTableViewCell", for: indexPath) as? PaymentMethodTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
        // 결제금액 cell
        else if indexPath.section == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? DeliveryAddressTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
        // 동의 cell
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as? DeliveryAddressTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }

    
    
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    
    // 셀의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 배송지 cell
        if indexPath.section == 0 {
            return tableView.frame.width / 1.4
        }
        // 주문자 cell
        else if indexPath.section == 1 {
            return tableView.frame.width / 1.9
        }
        // 주문상품 cell
        else if indexPath.section == 2 {
            return tableView.frame.width / 2.4
        }
        // 결제수단 cell
        else if indexPath.section == 3 {
            return tableView.frame.width * 0.73
        }
        // 결제금액 cell
        else if indexPath.section == 4 {
            return tableView.frame.width / 2
        }
        // 동의 cell
        else {
            return tableView.frame.width / 2
        }
    }
    
    
    
//    // MARK: - Footer
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//    }
//
//    // Footer 높이
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//
//    }
    
    
}
