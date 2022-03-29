//
//  HomeFollowingResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//



struct HomeFollowingResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [FollowingPost]
}


struct FollowingPost: Decodable  {
    var boardId: Int
    var contents: String
    var likeCnt: Int
    var scrapCnt: Int
    var commentCnt: Int
    var linkCnt: Int
    var boardImg1: String
    var boardImg2: String?
    var boardImg3: String?
    var boardImg4: String?
    var nickname: String
    var profile_Img: String?
    var time: String
    var isLiked: Int
}
