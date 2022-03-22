//
//  ModifyProfileResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//


struct ModifyProfileResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: String?
}
