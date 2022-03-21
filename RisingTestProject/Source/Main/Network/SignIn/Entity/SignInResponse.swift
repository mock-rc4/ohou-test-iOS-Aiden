//
//  SignInResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//



struct SignInResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: AccountID?
}


struct AccountID: Decodable {
    var account_Id: Int
    var jwt: String?
}
