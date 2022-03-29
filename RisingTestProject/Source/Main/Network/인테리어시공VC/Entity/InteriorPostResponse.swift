//
//  InteriorPostResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//



struct InteriorPostResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [InteriorPost]
}


struct InteriorPost: Decodable  {
    var profileImg: String
    var name: String
    var score: Int
    var distance: Int
    var contract: Int
}
