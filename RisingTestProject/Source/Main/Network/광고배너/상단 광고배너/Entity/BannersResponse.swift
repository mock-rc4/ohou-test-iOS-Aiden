//
//  BannersResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/21.
//



struct BannersResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [imageURL]
}


struct imageURL: Decodable {
    var banner_Img: String
}
