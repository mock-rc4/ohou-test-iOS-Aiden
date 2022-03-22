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
    
    
    
    // UILabel
    /// 특정 범위의 텍스트 글씨 색을 변경
    func changeTextColor(_ label: UILabel, color: UIColor, range: String) {
        guard let text = label.text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: range))
        
        label.attributedText = attributeString
    }
    
    
    
    // TableView 구분선 커스텀
    func addSeparator(_ cell: UITableViewCell) {
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(5.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.systemGray5
        cell.addSubview(additionalSeparator)
    }
    
    
    
    
    
    // MARK: - @objc 함수
    @objc func didTouchedDismissButton(_ animation: Bool) {
        self.dismiss(animated: animation)
    }
}
