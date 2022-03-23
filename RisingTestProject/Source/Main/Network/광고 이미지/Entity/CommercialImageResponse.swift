//
//  CommercialImageResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//


/// 스토어VC, 마이페이지VC에 필요한 image url
struct CommercialImageResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [imageURL]
}
