//
//  PopularityPhotoResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//



struct PopularityPhotoResponse: Decodable {
    
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [PopularityPhoto]
}


struct PopularityPhoto: Decodable  {
    var photo: String
    var nickname: String
}
