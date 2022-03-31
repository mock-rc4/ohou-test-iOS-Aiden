//
//  SearchViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/30.
//

import UIKit


class SearchViewController: BaseViewController {
    
    // UI연결
    @IBOutlet weak var searchBar: UIView!
    
    @IBOutlet var keywordView: [UIView]!
    
    @IBAction func didTapCancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI설정
        addRadiusToUIView(searchBar, size: searchBar.frame.height / 5)
        
        keywordView.forEach({
            $0.layer.cornerRadius = $0.frame.height / 2.5
            $0.layer.borderColor = UIColor.systemGray5.cgColor
            $0.layer.borderWidth = 1
        })
    }
    
    // 탭바 설정
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
