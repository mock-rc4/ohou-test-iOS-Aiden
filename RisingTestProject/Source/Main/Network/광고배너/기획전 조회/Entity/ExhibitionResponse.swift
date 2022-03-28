//
//  ExhibitionResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//



struct ExhibitionResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Exhibition]
}

struct Exhibition: Decodable  {
    var exhibitionId: Int
    var thumbnail: String
    var title: String
    var subtitle: String
    var goodsCnt: Int
}
