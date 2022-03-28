//
//  HomeHouseWarmingVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit
import MaterialComponents.MaterialBottomSheet


class HomeHouseWarmingVC: BaseViewController {
    
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
    
    
    // 집들이 글 데이터 저장
    var houseWarmingPosts: [HouseWarmingPost] = []
    
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - TableView 세팅
        tableView.delegate = self
        tableView.dataSource = self
        // cell
        tableView.register(UINib(nibName: "HouseWarmingTableViewCell", bundle: nil), forCellReuseIdentifier: "HouseWarmingTableViewCell")
        
        
        // 집들이 포스팅 조회 API 호출
        HouseWarmingDataManager().getPost(1, delegate: self)
    }
}


extension HomeHouseWarmingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터 개수
        return houseWarmingPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HouseWarmingTableViewCell", for: indexPath) as? HouseWarmingTableViewCell else {
            return UITableViewCell()
        }
        if houseWarmingPosts.count >= 1 {
            cell.updateCell(houseWarmingPosts[indexPath.row])
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.width * 0.9
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "HouseWarmingDetailVC") as? HouseWarmingDetailVC else {
            return
        }
        detailVC.postNumber = houseWarmingPosts[indexPath.row].houseId
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}





extension HomeHouseWarmingVC: ApiDelegate {
    func didTapAlignmentButton(_ filter: Int) {
        HouseWarmingDataManager().getPost(filter, delegate: self)
    }
    
}
