//
//  HouseWarmingDetailResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//



struct HouseWarmingDetailResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [HouseWarmingDetailPost]
}


struct HouseWarmingDetailPost: Decodable {
    var houseId: Int
    var title: String
    var authorId: Int?
    var nickname: String?
    var profile_Img: String?
    var isFollowing: Int?
    var houseImage: String
    var isNew: Int
    var isScrap: Int
    var housingType: String
    var space: String
    var budget: String
    var familyType: String
    var detailRange: String
    var period: String
    var field: String
    var worker: String
    var likeCnt: Int
    var scrapCnt: Int
    var commentCnt: Int
    var linkCnt: Int
    var checkCnt: Int
    var isExpert: Int
    var expertId: Int?
    var expertName: String?
    var expertProfileImg: String?
    var area: String
}
