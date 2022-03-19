//
//  ViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func viewDidAppear(_ animated: Bool) {
        // 사용자가 로그인 상태인지 & 둘러보기 버튼을 눌렀는지 여부에 따라 초기화면을 모달로 띄움
        if Constant.isUserLogged == false && Constant.isUserTapLookAroundButton == false {
            guard let initialVC = storyboard?.instantiateViewController(withIdentifier: "InitialViewController") as? InitialViewController else{
                 return
            }
            initialVC.modalPresentationStyle = .fullScreen

            self.present(initialVC, animated: true, completion: nil)
        }
    }
}

