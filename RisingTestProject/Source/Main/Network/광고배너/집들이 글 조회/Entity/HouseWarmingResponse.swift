//
//  HouseWarmingResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//



struct HouseWarmingResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [HouseWarmingPost]
}


struct HouseWarmingPost: Decodable {
    var houseId: Int
    var title: String
    var authorId: Int
    var nickname: String
    var profileImg: String?
    var houseImage: String
    var isNew: Int
    var isScrap: Int
    var scrapCnt: Int
    var checkCnt: Int
}
