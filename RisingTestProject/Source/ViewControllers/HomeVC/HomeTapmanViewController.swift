//
//  HomeTapmanViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit
import Tabman
import Pageboy

class HomeTapmanViewController: TabmanViewController {
    
    // UI연결
    @IBOutlet weak var tempView: UIView!
    
    
    // Tapman으로 전환시킬 VC들
    var viewControllers: [UIViewController] = []
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전환시킬 VC들 참조 얻어서 배열에 저장
        viewControllers = [
            storyboard?.instantiateViewController(withIdentifier: "HomePopularityVC") as! HomePopularityVC,
            storyboard?.instantiateViewController(withIdentifier: "HomeFollowingVC") as! HomeFollowingVC,
            storyboard?.instantiateViewController(withIdentifier: "HomePhotoVC") as! HomePhotoVC,
            storyboard?.instantiateViewController(withIdentifier: "HomeHouseWarmingVC") as! HomeHouseWarmingVC,
            storyboard?.instantiateViewController(withIdentifier: "HomeKnowHowVC") as! HomeKnowHowVC,
            storyboard?.instantiateViewController(withIdentifier: "HomeExpertVC") as! HomeExpertVC,
            storyboard?.instantiateViewController(withIdentifier: "HomeQnAVC") as! HomeQnAVC
        ]
        
        // datasource를 self로 지정
        self.dataSource = self
        
        
        // tapman bar 생성
        let bar = TMBar.ButtonBar()
        
        
        // bar속성 설정
        bar.backgroundView.style = .blur(style: .regular)  // 블러처리
        bar.layout.contentInset = UIEdgeInsets(top: 5.0, left: 15.0, bottom: 5.0, right: 15.0)  // inset 설정
        bar.buttons.customize({ (button) in
            // 선택되지 않았을 때
            button.tintColor = .black
            // 선택되었을 때
            button.selectedTintColor = .systemCyan
        })
        bar.layout.alignment = .centerDistributed   // 정렬 (왼, 오, 가운데)
//        bar.layout.contentMode = .fit      // bar item들 fit하게 View에 맞춤
        bar.layout.interButtonSpacing = 20    // 버튼 사이 간격
        
        // 인디케이터 조정 (탭맨 리스트 아래 선)
        bar.indicator.weight = .light
        bar.indicator.tintColor = .systemCyan
        bar.indicator.overscrollBehavior = .compress  // 좌우 스크롤 스타일
        
        // 커스텀
        bar.layout.transitionStyle = .snap
        
        
        
        // bar를 UIView에 추가
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
        
    }
}







// MARK: - 프로토콜 채택 & 함수 정의
extension HomeTapmanViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    // 탭맨으로 보여줄 VC의 수
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    // index별로 어떤 VC를 보여줄건지
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    // 기본(디폴트) VC
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    // TabBar 내부 글씨 (메뉴)
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "인기", badgeValue: nil)
        case 1:
            return TMBarItem(title: "팔로잉", badgeValue: nil)
        case 2:
            return TMBarItem(title: "사진", badgeValue: nil)
        case 3:
            return TMBarItem(title: "집들이", badgeValue: nil)
        case 4:
            return TMBarItem(title: "노하우", badgeValue: nil)
        case 5:
            return TMBarItem(title: "전문가집들이", badgeValue: nil)
        case 6:
            return TMBarItem(title: "질문과답변", badgeValue: nil)
        default:
            return TMBarItem(title: "\(index)번째", badgeValue: nil)
        }
    }
}
