//
//  BaseViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

/// 상속받는 모든 VC에 공통적으로 포함될 내용 정의한 클래스
class BaseViewController: UIViewController {
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Navigation Bar
        self.navigationController?.navigationBar.isHidden = true
        
        
        // Background Color
        self.view.backgroundColor = .white
    }
    
    
    
    
    
    
    // MARK: - 공통 변수
//    var someValue: String = "상속받는 모든 VC에서 공통적으로 필요한 변수"
    
    
    
    
    
    
    // MARK: - 공통 함수
    
    // UIImage
    func addRadiusToUIImageView(_ img: UIImageView, size: CGFloat) {
        img.layer.cornerRadius = size
    }

    
    
    // UIView
    func addBorderToUIView(_ to: UIView, size: CGFloat, color: CGColor) {
        to.layer.borderWidth = size
        to.layer.borderColor = color
    }
    
    func addRadiusToUIView(_ view: UIView, size: CGFloat) {
        view.layer.cornerRadius = size
    }
    
    
    
    // UIButton
    func addRadiusToUIButton(_ button: UIButton, size: CGFloat) {
        button.layer.cornerRadius = size
    }
    
    func addBorderToUIButton(_ button: UIButton, size: CGFloat, color: CGColor) {
        button.layer.borderWidth = size
        button.layer.borderColor = color
    }
    
    
    
    
    
    
    // MARK: - @objc 함수
    @objc func didTouchedDismissButton(_ animation: Bool) {
        self.dismiss(animated: animation)
    }
}
