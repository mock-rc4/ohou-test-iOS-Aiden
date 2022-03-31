//
//  MyShoppingViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class MyShoppingViewController: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // Cell 데이터
    var beforeLoginCellData = ["비회원 주문 조회하기", "고객센터"]
    var afterLoginCellData = ["주문배송내역 조회", "상품 스크랩북", "나의 문의내역", "나의 리뷰", "고객센터"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never

        
        tableView.register(UINib(nibName: "MyShoppingTapHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyShoppingTapHeader")
        
        tableView.register(UINib(nibName: "OngoingOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OngoingOrderTableViewCell")
        tableView.register(UINib(nibName: "MyShoppingTapCell", bundle: nil), forCellReuseIdentifier: "MyShoppingTapCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}



extension MyShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Constant.isUserLogged {
            return afterLoginCellData.count+1
        }else {
            return beforeLoginCellData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Constant.isUserLogged {
            if indexPath.row == 0 {
                guard let orderCell = tableView.dequeueReusableCell(withIdentifier: "OngoingOrderTableViewCell", for: indexPath) as? OngoingOrderTableViewCell else {
                    return UITableViewCell()
                }
                orderCell.selectionStyle = .none
                if let info = Constant.userInfo {
                    orderCell.updateCell(info)
                }
                return orderCell
            }else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyShoppingTapCell", for: indexPath) as? MyShoppingTapCell else {
                    return UITableViewCell()
                }
                cell.updateCell(afterLoginCellData[indexPath.row-1])
                cell.selectionStyle = .none
                return cell
            }
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyShoppingTapCell", for: indexPath) as? MyShoppingTapCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.updateCell(beforeLoginCellData[indexPath.row])
            return cell
        }
    }
    
    
    // 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if Constant.isUserLogged {
            if indexPath.row == 0 {
                return tableView.frame.width * 0.4
            }else {
                return 50
            }
        }else {
            return 50
        }
    }
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyShoppingTapHeader") as? MyShoppingTapHeader else {
            return UIView()
        }
        
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width / 4
    }
}
