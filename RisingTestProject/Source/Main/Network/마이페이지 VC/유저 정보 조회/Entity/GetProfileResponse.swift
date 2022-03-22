//
//  GetProfileResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//



struct GetProfileResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: UserInfo
}


struct UserInfo: Decodable {
    var nickname: String
    var profile_Img: String?
    var following_Cnt: Int
    var follower_Cnt: Int
    var scrap_Cnt: Int
    var like_Cnt: Int
    var order_Cnt: Int
    var cupon_Cnt: Int
    var point_Score: Int
    var introduce: String
}
