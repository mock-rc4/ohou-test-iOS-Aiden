//
//  WritingReviewRequest.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/29.
//



struct WritingReviewRequest: Encodable {
    var productId: Int
    var reviewImg: String?
    var contents: String
    var score: Int
}
