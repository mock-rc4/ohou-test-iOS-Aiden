//
//  ViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - UI 연결
    @IBOutlet weak var searchBar: UIView!
    
    // 장바구니 버튼
    @IBOutlet weak var basketButton: UIButton!
    
    // 검색 버튼
    @IBOutlet weak var searchButton: UIButton!
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        addRadiusToUIView(searchBar, size: searchBar.frame.height / 5)
        
        // 장바구니, 검색창 Button 타겟설정
        basketButton.addTarget(self, action: #selector(showBasketVC), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(showSearchVC), for: .touchUpInside)
    }


    
    // MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        // 사용자가 로그인 상태인지 & 둘러보기 버튼을 눌렀는지 여부에 따라 초기화면을 모달로 띄움
        if Constant.isUserLogged == false && Constant.isUserTapLookAroundButton == false {
            guard let initialVC = storyboard?.instantiateViewController(withIdentifier: "InitialNavigationController") as? UINavigationController else {
                return
            }
            
            initialVC.modalPresentationStyle = .fullScreen

            self.present(initialVC, animated: true, completion: nil)
        }
    }
}

