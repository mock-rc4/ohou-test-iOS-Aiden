//
//  StoreViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit


class StoreViewController: BaseViewController {
    
    @IBOutlet weak var searchBar: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        addRadiusToUIView(searchBar, size: searchBar.frame.height / 10)
    }
    
}
