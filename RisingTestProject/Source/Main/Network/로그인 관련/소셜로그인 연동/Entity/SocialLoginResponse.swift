//
//  SocialLoginResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/31.
//



struct SocialLoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AccountID?
}
