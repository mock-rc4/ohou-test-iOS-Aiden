//
//  StoreViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit


class StoreViewController: BaseViewController {
    
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var basketButton: UIButton!
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        addRadiusToUIView(searchBar, size: searchBar.frame.height / 5)
        basketButton.addTarget(self, action: #selector(showBasketVC), for: .touchUpInside)
        
        searchButton.addTarget(self, action: #selector(showSearchVC), for: .touchUpInside)
    }
    
}
