//
//  HomeExpertVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class HomeExpertVC: BaseViewController {
    
    // 전문자 집들이 글 데이터 저장
    var expertPosts: [ExpertPost] = []
    
    // 라인별로 보여줄 아이템 개수
    var twoItemsPerLine: Bool = true {
        didSet {
            if twoItemsPerLine {
                structureButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
            }else {
                structureButton.setImage(UIImage(systemName: "rectangle.grid.1x2.fill"), for: .normal)
            }
        }
    }
    
    // 정렬버튼
    @IBAction func didTapAlignmentButton(_ sender: UIButton) {
        guard let alignmentVC = storyboard?.instantiateViewController(withIdentifier: "AlignmentBottomSheetVC") as? AlignmentBottomSheetVC else {
            return
        }
        alignmentVC.delegate = self
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: alignmentVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 300
        present(bottomSheet, animated: true)
    }
    
    // UI연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // 셀 구조 변경하는 버튼
    @IBOutlet weak var structureButton: UIButton!
    @IBAction func didTapStructureButton(_ sender: UIButton) {
        if twoItemsPerLine {
            twoItemsPerLine = false
            collectionView.collectionViewLayout = createCompositionalLayout()
            collectionView.reloadData()
        }else {
            twoItemsPerLine = true
            collectionView.collectionViewLayout = createCompositionalLayout()
            collectionView.reloadData()
        }
    }
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // collectionview setting
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeExpertCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeExpertCollectionViewCell")
        collectionView.register(UINib(nibName: "HomeExpertCollectionViewCellOneLine", bundle: nil), forCellWithReuseIdentifier: "HomeExpertCollectionViewCellOneLine")
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        
        // API호출
        HomeExpertDataManager().getPost(1, delegate: self)
    }
}


extension HomeExpertVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expertPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if twoItemsPerLine {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeExpertCollectionViewCell", for: indexPath) as? HomeExpertCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.updateCell(expertPosts[indexPath.row])
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeExpertCollectionViewCellOneLine", for: indexPath) as? HomeExpertCollectionViewCellOneLine else {
                return UICollectionViewCell()
            }
            cell.updateCell(expertPosts[indexPath.row])
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "HouseWarmingDetailVC") as? HouseWarmingDetailVC else {
            return
        }
        detailVC.postNumber = expertPosts[indexPath.row].houseId
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}



// MARK: - CollectionView 레이아웃 잡기 (컴포지셔널 레이아웃)
extension HomeExpertVC {
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout {
            
        // 라인당 2개씩 보여줄 때
        if twoItemsPerLine {
            // 컴포지셔널 레이아웃 생성
            // 생성하면 튜플(key: value, key: value)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            let layout = UICollectionViewCompositionalLayout {
                // 매개변수와 반환타입 (내부에서 섹션을 구성하고 완성된 섹션을 반환하는 것)
                (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

                // 아이템에 대한 사이즈
                // absolute: 고정값, estimateed: 추측, fraction: 퍼센트(내 화면에서 얼마만큼 설정할건가.. 뭐 그런거)
                // fraction은 상위View를 기준으로 퍼센트 잡는듯 (ex- 아이템은 그룹 사이즈를 기준으로 % 잡는듯)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                // 그룹 사이즈
                let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.7))

                // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
                let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 2)

                // 그룹간의 간격 설정
    //                groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: groub)

                // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
    //                section.orthogonalScrollingBehavior = .continuous

                // 섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)

                return section
            }
            return layout
        }
        // 라인당 1개씩 보여줄 때
        else {
            // 컴포지셔널 레이아웃 생성
            // 생성하면 튜플(key: value, key: value)의 묶음으로 들어옴. 반환하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            let layout = UICollectionViewCompositionalLayout {
                // 매개변수와 반환타입 (내부에서 섹션을 구성하고 완성된 섹션을 반환하는 것)
                (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

                // 아이템에 대한 사이즈
                // absolute: 고정값, estimateed: 추측, fraction: 퍼센트(내 화면에서 얼마만큼 설정할건가.. 뭐 그런거)
                // fraction은 상위View를 기준으로 퍼센트 잡는듯 (ex- 아이템은 그룹 사이즈를 기준으로 % 잡는듯)
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                // 그룹 사이즈
                let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))

                // 그룹사이즈로 그룹 만들기 (horizontal, vertical 선택 가능)
                let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 1)

                // 그룹간의 간격 설정
    //                groub.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: groub)

                // 섹션 내부의 그룹들을 스크롤 가능하게 하는 코드 (continuous = 일반 스크롤, pagin = 그룹별로 스크롤)
    //                section.orthogonalScrollingBehavior = .continuous

                // 섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15)

                return section
            }
            return layout
        }
        
        
    }
}



extension HomeExpertVC: ApiDelegate {
    func didTapAlignmentButton(_ filter: Int) {
        HomeExpertDataManager().getPost(filter, delegate: self)
    }
    
}
