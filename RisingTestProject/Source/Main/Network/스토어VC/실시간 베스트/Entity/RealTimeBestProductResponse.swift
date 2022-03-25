//
//  RealTimeBestProductResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//


struct RealTimeBestProductResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ProductCellInfoNoRemain]
}
