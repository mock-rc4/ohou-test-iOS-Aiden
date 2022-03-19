//
//  Int.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

extension Int {
    
    /// 숫자를 콤마 찍어서 문자열로 반환
    func insertComma() -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: self))!
            return result
    }
}
