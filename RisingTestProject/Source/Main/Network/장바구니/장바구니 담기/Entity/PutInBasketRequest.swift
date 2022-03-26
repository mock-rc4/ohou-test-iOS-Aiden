//
//  PutInBasketRequest.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//


struct PutInBasketRequest: Encodable {
    var productId: Int
    var productCnt: Int
}
