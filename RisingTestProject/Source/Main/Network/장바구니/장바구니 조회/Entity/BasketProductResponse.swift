//
//  GetBasketProductResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/26.
//


struct BasketProductResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [BasketProductInfo]
}


struct BasketProductInfo: Decodable  {
    var productId: Int
    var name: String
    var company: String
    var price: Int
    var isFree: Int
    var deliveryCharge: Int
    var salesPrice: Int
    var productCnt: Int
    var productImg1: String
}
