//
//  UIButton.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit


extension UIButton {
    
    // MARK: - 버튼 내부에 Indicator 설정
    /// 인디케이터 켜기
    func showIndicator() {
        let indicator = UIActivityIndicatorView()
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    /// 인디케이터 끄기
    func dismissIndicator() {
        for view in self.subviews {
            if let indicator = view as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
    
    // underline 추가
    func addUnderLine() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    
    
    // 버튼 title크기 변경
    func setFontSize(_ title: String, size: CGFloat) {
        let buttonTitle = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size)
        ])
        
        self.setAttributedTitle(buttonTitle, for: .normal)
    }
}
