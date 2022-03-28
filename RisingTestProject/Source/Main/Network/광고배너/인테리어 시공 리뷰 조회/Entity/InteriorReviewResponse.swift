//
//  InteriorReviewResponse.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//


struct InteriorReviewResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [InteriorReview]
}


struct InteriorReview: Decodable {
    var name: String
    var profileImg: String?
    var contents: String
    var img: String
}
