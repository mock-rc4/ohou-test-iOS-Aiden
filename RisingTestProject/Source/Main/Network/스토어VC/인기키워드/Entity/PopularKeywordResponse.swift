//
//  PopularKeywordResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/23.
//



struct PopularKeywordResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [PopularKeyword]
}


struct PopularKeyword: Decodable {
    var keyword: String
    var keywordImg: String
}
