//
//  PopularityTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

class PopularityTableViewHeader: UITableViewHeaderFooterView {

    // UI 연결
    @IBOutlet weak var commercialCollectionView: UICollectionView!
    
    
    // 광고 이미지 데이터
    var imageArray: [UIImage] = []
    
    
    // 현재 페이지 체크할 변수
    var currentPage: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // collectionView 세팅
        commercialCollectionView.delegate = self
        commercialCollectionView.dataSource = self
        commercialCollectionView.register(UINib(nibName: "CommercialBannerCell", bundle: nil), forCellWithReuseIdentifier: "CommercialBannerCell")
        
//        // 자동 스크롤 타이머 실행
        bannerTimer()

    }
    
    
//    func convertUrlToUIImage(_ url: String) -> UIImage {
//        let url = URL(string: url)
//        let data = try Data(contentsOf: url!)
//    }

}





// MARK: - CollectionView 기본 Protocol 채택
extension PopularityTableViewHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommercialBannerCell", for: indexPath) as? CommercialBannerCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCell(imageArray[indexPath.row])
        
        return cell
    }
    
}



// MARK: - CollectionView 사이즈 설정 protocol 채택 & 자동 스크롤 설정
extension PopularityTableViewHeader: UICollectionViewDelegateFlowLayout {
    
    // 컬렉션뷰 사이즈 설정 (아이템 사이즈 설정)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // 컬렉션뷰 감속(스크롤) 끝났을 때 현재 페이지 체크 (자동 스크롤을 위해 필요)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}





// MARK: - 자동스크롤 위한 타이머 함수
extension PopularityTableViewHeader {
    
    // 2초마다 실행되는 타이머
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (Timer) in
            self.bannerMove()
        })
    }
    
    // 타이머가 실행하는 함수 -> 배너를 움직이는 함수
    func bannerMove() {
        // 현재 페이지가 마지막 페이지일 경우
        if currentPage == imageArray.count - 1 {
            // 맨 처음 페이지로 돌아가기
            commercialCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            currentPage = 0
            return
        }
        
        // 다음 페이지로 전환
        currentPage += 1
        commercialCollectionView.scrollToItem(at: NSIndexPath(item: currentPage, section: 0) as IndexPath, at: .right, animated: true)
    }
}
