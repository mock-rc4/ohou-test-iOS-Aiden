//
//  Constant.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

//import Alamofire

/// 전역으로 사용되는 내용들을 저장하는 곳
/// Contant.baseURL 형식으로 가져다가 사용
struct Constant {
    
    
    // 유저가 로그인 상태인지?
    static var isUserLogged: Bool = false
    
    // 유저가 둘러보기 버튼을 눌렀는지?
    static var isUserTapLookAroundButton: Bool = false
    
    // API호출 기본 url
    static let baseURL = "https://prod.eun0-dev.com"
    
    
    // 로그인 성공하면 저장할 값
    static var accoundID: Int?
    static var jwt: String?
    
    
    // 유저 정보
    static var userInfo: UserInfo?
    
    
    
    // 광고 이미지 배열
    static var storeViewBannerImage: [UIImage] = []
    static var myPageViewBannerImage: [UIImage] = []
}
