//
//  ProductReviewTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/24.
//

import UIKit

class ProductReviewTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // collectionView 세팅
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // cell
        collectionView.register(UINib(nibName: "ProductReviewHeader", bundle: nil), forCellWithReuseIdentifier: "ProductReviewHeader")
//        collectionView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
//        collectionView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
//        collectionView.register(UINib(nibName: <#T##String#>, bundle: <#T##Bundle?#>), forCellWithReuseIdentifier: <#T##String#>)
        
        collectionView.collectionViewLayout = createCompositionalLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension ProductReviewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            // 리뷰 사진의 개수
            return 10
        }else if section == 2 {
            // Cell에 보여지는 리뷰 개수 (3개)
            return 3
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // header
        if indexPath.section == 0 {
            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductReviewHeader", for: indexPath) as? ProductReviewHeader else {
                return UICollectionViewCell()
            }
            return header
        }
        // 사진 리스트 (가로스크롤)
        else if indexPath.section == 1 {
            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductReviewHeader", for: indexPath) as? ProductReviewHeader else {
                return UICollectionViewCell()
            }
            return header
        }
        // 베스트리뷰 (3개)
        else if indexPath.section == 2 {
            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductReviewHeader", for: indexPath) as? ProductReviewHeader else {
                return UICollectionViewCell()
            }
            return header
        }
        // footer
        else {
            guard let header = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductReviewHeader", for: indexPath) as? ProductReviewHeader else {
                return UICollectionViewCell()
            }
            return header
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
}






// MARK: - CollectionView 레이아웃 잡기 (컴포지셔널 레이아웃)
extension ProductReviewTableViewCell {
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
            
        // 컴포지셔널 레이아웃 생성
        // 생성하면 튜플(key: value, key: value)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
        let layout = UICollectionViewCompositionalLayout {
            // 매개변수와 반환타입 (내부에서 섹션을 구성하고 완성된 섹션을 반환하는 것)
            (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
            // header
            if sectionIndex == 0 {
                // 아이템에 대한 사이즈
                // absolute: 고정값, estimateed: 추측, fraction: 퍼센트(내 화면에서 얼마만큼 설정할건가.. 뭐 그런거)
                // fraction은 상위View를 기준으로 퍼센트 잡는듯 (ex- 아이템은 그룹 사이즈를 기준으로 % 잡는듯)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    
                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    
                // 그룹 사이즈
                let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2))
                    
                // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
                let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 1)
                    
                // 그룹간의 간격 설정
//                groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                    
                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: groub)
                    
                // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
//                section.orthogonalScrollingBehavior = .continuous
                    
                // 섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
                    
                return section
            }
            // Header, Footer
            else {
                // 아이템에 대한 사이즈
                // absolute: 고정값, estimateed: 추측, fraction: 퍼센트(내 화면에서 얼마만큼 설정할건가.. 뭐 그런거)
                // fraction은 상위View를 기준으로 퍼센트 잡는듯 (ex- 아이템은 그룹 사이즈를 기준으로 % 잡는듯)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    
                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    
                // 그룹 사이즈
                let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/8))
                    
                // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
                let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 1)
                    
                // 그룹간의 간격 설정
                //groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                    
                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: groub)
                    
                // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
//                section.orthogonalScrollingBehavior = .continuous
                    
                // 섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15)
                    
                return section
            }
        }
            
        return layout
    }
}
