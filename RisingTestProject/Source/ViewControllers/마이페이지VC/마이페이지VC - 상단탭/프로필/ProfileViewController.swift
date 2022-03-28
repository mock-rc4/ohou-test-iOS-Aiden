//
//  ProfileViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    
    // 기본 셀 정보 데이터
    var cellTitleArray: [String] = [
        "스크랩북",
        "집들이",
        "노하우",
        "질문과답변",
        "리뷰쓰기",
        "리뷰",
        "인테리어시공 상담내역",
        "고객센터"
    ]
    var cellCountArray: [String] = [
        "0", "0", "0", "", "", "0", "0", ""
    ]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.register(UINib(nibName: "ProfileTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "ProfileTableViewHeader")
        tableView.register(UINib(nibName: "AfterLoginProfileTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "AfterLoginProfileTableViewHeader")
        
        tableView.register(UINib(nibName: "MyShoppingTableViewCell", bundle: nil), forCellReuseIdentifier: "MyShoppingTableViewCell")
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoTableViewCell")
        tableView.register(UINib(nibName: "CommercialTableViewCell", bundle: nil), forCellReuseIdentifier: "CommercialTableViewCell")
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        
        
        // 광고배너 API 호출
        CommercialImageDataManager().getBannerImage(CommercialImageRequest(location: "myPage"), delegate: self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        // 유저 정보 조회하기 API 호출
        if Constant.isUserLogged && Constant.profileChanged {
            GetProfileDataManager().getProfile(delegate: self)
            Constant.profileChanged = false
        }
        if Constant.isUserLogged == false && Constant.userDidTapLogoutButton {
            tableView.reloadData()
            Constant.userDidTapLogoutButton = false
        }
        if Constant.isUserLogged && Constant.didUserOrderProduct {
            GetProfileDataManager().getProfile(delegate: self)
            Constant.didUserOrderProduct = false
        }
    }
}



// MARK: - tableview Protocol 채택
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // 나의 쇼핑
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyShoppingTableViewCell", for: indexPath) as? MyShoppingTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if let user = Constant.userInfo {
                cell.updateCell(user)
            }
            return cell
            
        }else if indexPath.row == 1 {
            // 사진
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
            
        }else if indexPath.row == 2 {
            // 광고
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommercialTableViewCell", for: indexPath) as? CommercialTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.commercialArray = Constant.myPageViewBannerImage
            cell.collectionView.reloadData()
            return cell
            
        }else {
            // 일반 셀
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.updateCell(cellTitleArray[indexPath.row-3], count: cellCountArray[indexPath.row-3])
            return cell
        }
    }
    
    
    
    // 테이블뷰 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            // 나의 쇼핑
            return tableView.frame.width * 0.45
        }else if indexPath.row == 1 {
            // 사진
            return tableView.frame.width * 1.4
        }else if indexPath.row == 2 {
            // 광고
            return tableView.frame.width / 2.6
        }else {
            // 일반 셀
            return 50
        }
    }
    
    
    // 리뷰VC로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK: - 로그인해야 이동할 수 있도록 수정
        if indexPath.row == 7 {
            guard let reviewVC = storyboard?.instantiateViewController(withIdentifier: "ChooseProductToReviewVC") as? ChooseProductToReviewVC else {
                return
            }
            self.navigationController?.pushViewController(reviewVC, animated: true)
        }
    }
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if Constant.isUserLogged {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AfterLoginProfileTableViewHeader") as? AfterLoginProfileTableViewHeader else {
                return UIView()
            }
            if let user = Constant.userInfo {
                headerView.updateCell(user)
            }
            return headerView
            
        }else {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileTableViewHeader") as? ProfileTableViewHeader else {
                return UIView()
            }
            headerView.delegate = self
            return headerView
        }
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.6
    }
}



extension ProfileViewController: showLoginVC {
    func presentLoginVC() {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "InitialNavigationController") as? UINavigationController else {
            return
        }
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
    
}
