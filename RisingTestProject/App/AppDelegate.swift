//
//  AppDelegate.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit
import KakaoSDKCommon
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    // 앱 실행 직후, 사용자에게 화면 보여지기 전에 호출
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 카카오 sdk초기화
        KakaoSDK.initSDK(appKey: KakaoKey.kakaoKey)
        
        
        // 유저디폴트에 있는 jwt 유효성검사를 세마포어 사용하여 동기적으로 처리
        Constant.jwt = UserDefaults.standard.string(forKey: "jwt")
        AutoLoginDataManager().jwtCheck()
        Constant.semaphore.wait()
        
        
        // MARK: - 네이버 설정
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        instance?.isNaverAppOauthEnable = true        // 네이버앱 로그인 설정
        instance?.isInAppOauthEnable = true           // 사파리 로그인 설정
        instance?.isOnlyPortraitSupportedInIphone()   // 인증화면을 iPhone의 세로 모드에서만 사용
        
        instance?.serviceUrlScheme = "naverlogin"           // URL Scheme
        instance?.consumerKey = NaverKey.clientID         // 클라이언트 아이디
        instance?.consumerSecret = NaverKey.clientSecret  // 시크릿 아이디
        instance?.appName = "오늘의집"                   // 앱 이름
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

