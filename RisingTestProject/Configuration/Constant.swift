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
    
    // jwt토큰 유효성검사를 동기적으로 처리하기 위한 세마포어
    static let semaphore = DispatchSemaphore(value: 0)
    
    // 유저가 로그인 상태인지?
    static var isUserLogged: Bool = false
    
    // 유저가 둘러보기 버튼을 눌렀는지?
    static var isUserTapLookAroundButton: Bool = false
    
    
    // API호출 기본 url
    static let baseURL = "https://prod.eun0-dev.com"
    
    
    // 로그인 성공하면 저장할 값
    // 로그인 성공하면 userDefault에도 jwt 저장
    static var accoundID: Int?
    static var jwt: String?
    
    // 카카오 로그인 성공하면 저장할 값
    static var kakaoOauthToken: String?
    
    
    
    // 유저 정보
    static var userInfo: UserInfo?
    
    
    // 프로필이 수정되었는지 여부 저장
    static var profileChanged: Bool = true
    
    // 로그아웃 버튼을 눌렀는지 여부 저장
    static var userDidTapLogoutButton: Bool = false
    
    
    // 광고 이미지 배열
    static var storeViewBannerImage: [UIImage] = []
    static var myPageViewBannerImage: [UIImage] = []
    
    static var interiorBannerImage: [UIImage] = []
    
    // 오늘의 딜 데이터
    static var todayDealProductInfo: [ProductCellInfo] = []
    
    // 내가본 상품과 연관상품 데이터
    static var relatedUserSawProductInfo: [ProductCellInfoNoRemain] = []
    
    // 추천상품 데이터
    static var recommendProductInfo: [ProductCellInfoNoRemain] = []
    
    // 최근 본 상품
    static var recentlySeenProductInfo: [ProductCellInfoNoRemain] = []
    static var didUserSeeProduct: Bool = false
    
    // 인기상품
    static var popularProductInfo: [ProductCellInfoNoRemain] = []
    
    
    // 결제가 완료되었는지 여부 저장
    static var didUserOrderProduct: Bool = false
}
