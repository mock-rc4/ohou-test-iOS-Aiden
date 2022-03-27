//
//  HomeExpertResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//


struct HomeExpertResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ExpertPost]
}


struct ExpertPost: Decodable  {
    var houseId: Int
    var title: String
    var houseImage: String
    var isNew: Int
    var isScrap: Int
    var scrapCnt: Int
    var checkCnt: Int
    var name: String
    var profileImg: String?
}
