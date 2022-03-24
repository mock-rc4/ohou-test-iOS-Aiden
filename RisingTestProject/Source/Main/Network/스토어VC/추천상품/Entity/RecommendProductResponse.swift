//
//  RecommendProductResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//



struct RecommendProductResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ProductCellInfoNoRemain]
}
