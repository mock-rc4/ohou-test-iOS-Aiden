//
//  ReviewResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//


struct ReviewResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ReviewData]
}


struct ReviewData: Decodable  {
    var productId: Int
    var reviewImg: String?
    var contents: String
    var score: Int
    var nickname: String
    var profile_Img: String?
    var time: String
}
