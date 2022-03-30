//
//  TodayDealResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//



struct TodayDealResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ProductCellInfo]
}


struct ProductCellInfo: Decodable {
    var productId: Int
    var name: String
    var company: String?
    var sale: Int
    var reviewCnt: Int
    var score: Float
    var isFree: Int
    var isSpecial: Int
    var isScrap: Int
    var salesPrice: Int
    var productImg1: String
    var productImg2: String?
    var productImg3: String?
    var productImg4: String?
    var productImg5: String?
    var productImg6: String?
    var productImg7: String?
    var productImg8: String?
    var remainDays: Int
}
