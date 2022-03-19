//
//  String.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//


import UIKit


extension String {
    
    /// 값이 있는지 확인
    var isExists: Bool {
        return !self.isEmpty
    }
    
    /// 문자열 앞뒤의 공백이 제거된 문자열을 반환
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 사용자의 입력값이 비었는지 확인 (앞뒤 공백 제거 후 isEmpty사용)
    ///  필수 입력값을 받는 공간이 비었는지 확인하는 로직에 사용
    var userInputIsEmpty: Bool {
//        let removeSpace = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let removeSpace = self.trim
        return removeSpace.isEmpty
    }
    
    
    
    // MARK: - subString
    /// index번호(from, to)를 입력하여 해당 부분의 subString을 반환  -> from ~ to-1
    func substring(from: Int, to: Int) -> String {
        guard (to >= 0) && (from <= self.count) && (from <= to) else {
            return ""
        }
        let start = index(startIndex, offsetBy: max(from, 0))
        let end = index(start, offsetBy: min(to, self.count) - from)
        return String(self[start ..< end])
    }
    
    /// index범위를 입력하여 해당 부분의 subString을 반환  -> ex) 1..<4
    func substring(range: Range<Int>) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
    
    
    
    // MARK: - indexing
    /// 특정 index의 문자를 반환
    func get(_ index: Int) -> String {
        return self.substring(range: index..<index+1)
    }
    
    
    
    // MARK: - replace
    /// target을 with로 변경하여 리턴
    func replace(target: String, with withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    
    
    // MARK: - comma
    /// ex) "1234567890".insertComma == "1,234,567,890"
    /// 숫자 문자열을 콤마 찍어서 반환
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let doubleValue = Double(self) else{
            return self
        }
        
        let result = numberFormatter.string(from: NSNumber(value: doubleValue))!
        return result
    }
    
    
}
