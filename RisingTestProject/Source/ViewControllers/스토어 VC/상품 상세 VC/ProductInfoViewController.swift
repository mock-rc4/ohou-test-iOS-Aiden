//
//  ProductInfoViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//

import UIKit
// 바텀시트
import MaterialComponents
// 테이블뷰확장
import ExpyTableView


class ProductInfoViewController: BaseViewController {
    
    // 펼치기로 확장되는 Cell에 넣을 이미지 배열
    var productInfoImageArray: [String] = []
    
    
    // 보여줄 제품의 ID
    var productID: Int?
    
    // 보여줄 제품의 정보
    var productDetail: ProductDetail? {
        didSet {
            if let idNum = productDetail?.productId {
                let productInfo = Constant.popularProductInfo.filter({
                    $0.productId == idNum
                })
                let isAlready = Constant.recentlySeenProductInfo.contains(where: {
                    $0.productId == idNum
                })
                if !isAlready {
                    Constant.recentlySeenProductInfo.insert(productInfo[0], at: 0)
                    Constant.didUserSeeProduct = true
                }
            }
        }
    }
    
    
    // MARK: - UI 연결
    @IBOutlet weak var tableView: ExpyTableView!
    
    // 장바구니 버튼
    @IBOutlet weak var basketButton: UIButton!
    
    // 뒤로가기 버튼
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Bottom Sheet
    // 구매하기 버튼 클릭
    @IBAction func didTapPurchaseButton(_ sender: UIButton) {
        guard let optionVC = storyboard?.instantiateViewController(withIdentifier: "ProductOptionViewController") as? ProductOptionViewController else {
            return
        }
        optionVC.basePrice = productDetail!.salesPrice
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: optionVC)
        
        // bottomsheet의 높이
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = view.frame.width / 3
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
        tableView.register(UINib(nibName: "ProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInfoTableViewCell")
        tableView.register(UINib(nibName: "EXProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "EXProductInfoTableViewCell")
        tableView.register(UINib(nibName: "ProductReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductReviewTableViewCell")
        tableView.register(UINib(nibName: "QuestionDeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionDeliveryTableViewCell")
//        tableView.register(UINib(nibName: "RecommendedProductTableViewCell", bundle: nil), forCellReuseIdentifier: "RecommendedProductTableViewCell")
        
        // 장바구니 버튼 addTarget
        basketButton.addTarget(self, action: #selector(showBasketVC), for: .touchUpInside)
        
        
        // 제품정보 가져오기 API 호출
        if let id = productID {
            ProductInfoDataManager().getProductInfo(ProductInfoRequest(productId: id), delegate: self)
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}




// MARK: - TableView Protocol 채택
extension ProductInfoViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    // MARK: - EXTableView
    
    // true로 안주면 Header셀 함수(expandableCellForSection) 호출 자체가 안되네..;; 뭐지
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    // 열리고 닫히고 상태가 변경될 때 호출
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        // 매개변수 state로 열리고 닫히는 상태를 전달받음
//        switch state {
//        case .willExpand:
//            print("펼쳐질거다: willExpand")
//        case .willCollapse:
//            print("닫힐거다: willCollapse")
//        case .didExpand:
//            print("펼쳐졌다: didExpand")
//        case .didCollapse:
//            print("닫힘: didCollapse")
//        }
    }
    
    // 헤더셀
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        print(section)
        // 유저들의 스타일링(사진리뷰 셀)
        if section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserStylingTableViewCell") as? UserStylingTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        // 상품설명 셀 (펼치기, 접기)
        else if section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoTableViewCell") as? ProductInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        // 리뷰 셀
        else if section == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductReviewTableViewCell") as? ProductReviewTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
        // 문의 셀
        else if section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionDeliveryTableViewCell") as? QuestionDeliveryTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.updateCell(title: "문의", 1043)
            return cell
        }
        // 배송/교환/환불 셀
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionDeliveryTableViewCell") as? QuestionDeliveryTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.updateCell(title: "배송/교환/환불", nil)
            return cell
        }
    }
    
    // 내부셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EXProductInfoTableViewCell") as? EXProductInfoTableViewCell else {
                return UITableViewCell()
            }
            if productInfoImageArray.count >= 1 {
                cell.updateCell(productInfoImageArray[indexPath.row-1])
            }
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    // 각 섹션(헤더셀)에 들어갈 내부셀(row)의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return 1 + productInfoImageArray.count
        }else {
            return 1
        }
    }
    
    // 테이블뷰 셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 유저 스타일링 Cell
        if indexPath.section == 0 {
            return tableView.frame.width * 1.2
        }
        // 상품정보 Cell
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 70
            }else {
                // 펼쳐질 상품정보 Cell 높이
                return tableView.frame.width
            }
        }
        // 리뷰 Cell
        else if indexPath.section == 2 {
            return tableView.frame.width * 2.4
        }
        // 문의, 배송/교환/환불 셀
        else {
            return tableView.frame.width / 8
        }
    }
    
    
    
    // 섹션의 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    
    
    
    // MARK: - header
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProductInfoTableViewHeader") as? ProductInfoTableViewHeader else {
                return UIView()
            }
            if let productInfo = productDetail {
                headerView.updateCell(productInfo)
            }
            return headerView
        }else {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 10))
            view.backgroundColor = UIColor.systemGray5
            return view
        }
    }
    
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return tableView.frame.width * 2.3
        }else {
            return 10
        }
    }
    
}
