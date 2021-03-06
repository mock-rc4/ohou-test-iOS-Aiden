//
//  BasketViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit



final class BasketViewController: BaseViewController {
    
    // 전체선택 bool
    var isAllSelected: Bool?
    
    
    // UI 연결
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    // 현재 선택되어 있는 상품들의 Id값
    var selectedProductID: Set<Int> = []
    
    
    // 장바구니에 담긴 상품들 배열
    var inBasketProduct: [BasketProductInfo] = [] {
        didSet {
            if !inBasketProduct.isEmpty {
                inBasketProduct.forEach({
                    selectedProductID.insert($0.productId)
                })
            }
        }
    }
    
    var totalPrice: Int = 0
    var totalDeliveryCharge: Int = 0
    var discountPrice: Int = 0
    var finalPrice: Int = 0
    
    func updatePrice() {
        totalPrice = inBasketProduct.map({
            $0.price * $0.productCnt
        }).reduce(0, +)
        totalDeliveryCharge = inBasketProduct.map({$0.deliveryCharge}).reduce(0, +)
        discountPrice = inBasketProduct.filter({$0.salesPrice != 0}).map({
            ($0.price - $0.salesPrice) * $0.productCnt
        }).reduce(0, +)
        finalPrice = totalPrice + totalDeliveryCharge - discountPrice
    }
    
    
    
    
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
    
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        // 장바구니 조회 API 호출
        BasketProductDataManager().getBasketProductInfo(delegate: self)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}




// MARK: - TableView Protocol
extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Cell
    // 섹션별 아이템 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 상품이 담기기 전
        if inBasketProduct.isEmpty {
            return 1
        }
        // 상품이 담긴 후
        else {
            if section == 1{
                // 장바구니에 담긴 아이템의 개수
                return inBasketProduct.count
            }else {
                return 1
            }
        }
    }
    
    // 사용할 Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 상품이 담기기 전
        if inBasketProduct.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeforePutInProductTableCell", for: indexPath) as? BeforePutInProductTableCell else {
                return UITableViewCell()
            }
            return cell
        }
        // 상품이 담긴 후
        else {
            // 전체선택 버튼이 있는 Cell
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectAllTableViewCell", for: indexPath) as? SelectAllTableViewCell else {
                    return UITableViewCell()
                }
                cell.delegate = self
                return cell
            }
            // 장바구니에 담긴 아이템들 보여주는 cell
            else if indexPath.section == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInBasketTableViewCell", for: indexPath) as? ProductInBasketTableViewCell else {
                    return UITableViewCell()
                }
                if let selected = isAllSelected {
                    // MARK: - 여기서 토글을 해줄까..
                    cell.isButtonSelected = selected
                    if selected {
                        cell.checkImage.image = UIImage(systemName: "checkmark.square.fill")
                    }else {
                        cell.checkImage.image = UIImage(systemName: "square")
                    }
                }
                cell.delegate = self
                cell.updateCell(inBasketProduct[indexPath.row])
                return cell
            }
            // 금액정보를 보여주는 cell
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceTableViewCell", for: indexPath) as? TotalPriceTableViewCell else {
                    return UITableViewCell()
                }
                cell.updateCell(totalP: totalPrice, totalD: totalDeliveryCharge, discount: discountPrice, finalP: finalPrice)
                return cell
            }
        }
    }
    
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        // 상품이 담기기 전
        if inBasketProduct.isEmpty {
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
        if inBasketProduct.isEmpty {
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
        if inBasketProduct.isEmpty {
            return nil
        }
        // 상품이 담긴 후
        else {
            if section == 2 {
                guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BasketTableViewFooter") as? BasketTableViewFooter else {
                    return UIView()
                }
                footerView.delegate = self
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



// 테이블뷰 리로드 프로토콜
extension BasketViewController: TableViewReload {
    
    // 상품이 선택&안선택 토글되면 상태 저장
    func saveIsProductSelected(_ productID: Int, isSelected: Bool) {
        if isSelected {
            selectedProductID.insert(productID)
        }else {
            selectedProductID.remove(productID)
        }
    }
    
    
    // 장바구니에서 상품 삭제
    func deleteProduct(_ productID: Int) {
        presentAlert(title: "정말 삭제하시겠습니까?", isCancelActionIncluded: true, preferredStyle: .alert, handler: { _ in
            DeleteProductDataManager().deleteProduct(DeleteProductRequest(status: 0), delegate: self, productID: productID)
        })
    }
    
    // 장바구니에 있는 상품 개수 수정
    func productCountUpdate(_ productID: Int, count: Int) {
        ModifyProductCountDataManager().modifyProductCount(ModifyProductCountRequest(productCnt: count), delegate: self, productID: productID)
    }
    
    // 테이블뷰 리로드
    func tableViewReload() {
        BasketProductDataManager().getBasketProductInfo(delegate: self)
    }
}


// 결제창 띄우려는 프로토콜
extension BasketViewController: showPeymentVC {
    func showPeymentVC() {
        guard let paymentVC = storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController else {
            return
        }
        paymentVC.forPaymentProductInfo = inBasketProduct
        paymentVC.totalPrice = self.totalPrice
        paymentVC.totalDeliveryCharge = self.totalDeliveryCharge
        paymentVC.discountPrice = self.discountPrice
        paymentVC.finalPrice = self.finalPrice
        
        self.navigationController?.pushViewController(paymentVC, animated: true)
    }
    
}


// 전체선택 버튼 구현을 위한 프로토콜 채택
extension BasketViewController: selectAllButtonDelegate {
    
    // 선택된 상품들 제거
    func removeSelectedProduct() {
        presentAlert(title: "선택된 상품들을 삭제하시겠습니까?", isCancelActionIncluded: true) { _ in
            self.selectedProductID.forEach({
                DeleteProductDataManager().deleteProduct(DeleteProductRequest(status: 0), delegate: self, productID: $0)
            })
        }
    }
    
    // 모두선택 버튼 클릭
    func selectAll(_ isSelect: Bool) {
        
        if isSelect {
            inBasketProduct.forEach({
                selectedProductID.insert($0.productId)
            })
        }else {
            selectedProductID.removeAll()
        }
        
        self.isAllSelected = isSelect
        self.tableView.reloadData()
    }
    
}
