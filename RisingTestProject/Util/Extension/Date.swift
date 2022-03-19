//
//  Date.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit


extension Date {
    
    /// Date(year: 2022, month: 3, day: 16) -> 이런식으로 입력하면 Date() 타입으로 변환하여 저장
    init(year: Int, month: Int, day: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd"
        self = dateFormatter.date(from: "\(year):\(month):\(day)") ?? Date()
    }
    
    /// Date() 타입을 "yyyy-MM-dd" 형식의 문자열로 반환
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    /// Date() 타입을 "yyyy-MM-dd hh:mm:ss" 형식의 문자열로 반환
    var detailText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return dateFormatter.string(from: self)
    }
    
}
