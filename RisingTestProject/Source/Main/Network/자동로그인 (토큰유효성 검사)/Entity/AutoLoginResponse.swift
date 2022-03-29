//
//  AutoLoginResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//



struct AutoLoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: autoLoginData?
}


struct autoLoginData: Decodable {
    var accountId: Int
    var nickname: String
}
