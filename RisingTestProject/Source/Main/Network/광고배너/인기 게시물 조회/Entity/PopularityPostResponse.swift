//
//  PopularityPostResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//


struct PopularityPostResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [PopularityPost]
}

struct PopularityPost: Decodable  {
    var headerTitle: String
    var houseId: Int
    var title: String
    var houseImage: String
    var isScrap: Int
}
