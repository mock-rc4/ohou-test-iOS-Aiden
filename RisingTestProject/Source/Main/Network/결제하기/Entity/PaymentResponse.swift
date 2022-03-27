//
//  PaymentResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//


struct PaymentResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String
}
