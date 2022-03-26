//
//  PutInBasketResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//



struct PutInBasketResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Int
}
