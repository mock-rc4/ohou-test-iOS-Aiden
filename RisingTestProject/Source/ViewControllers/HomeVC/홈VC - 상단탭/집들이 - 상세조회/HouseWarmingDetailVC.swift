//
//  HouseWarmingDetailVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


class HouseWarmingDetailVC: BaseViewController {
    
    // 게시글 고유번호
    var postNumber: Int?
    
    // 게시글 정보
    var postInfo: HouseWarmingDetailPost? {
        didSet {
            if let info = postInfo {
                if info.isExpert == 0 {
                    nickName.text = info.nickname
                }else {
                    nickName.text = info.expertName
                }
                likeCount.text = "\(info.likeCnt)"
                scrapCount.text = "\(info.scrapCnt)"
                commentCount.text = "\(info.commentCnt)"
                linkCount.text = "\(info.linkCnt)"
            }
        }
    }
    
    // 데이터
    var houseWarmingTitles: [String] = ["주거형태", "평수", "지역", "가족형태", "작업자"]
    var expertTitles: [String] = ["주거형태", "평수", "지역", "가족형태", "작업자", "세부시공범위"]
    
    
    // MARK: - UI연결
    @IBOutlet weak var tableView: UITableView!
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var scrapCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var linkCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView 설정
        tableView.delegate = self
        tableView.dataSource = self
        
        // cell
        tableView.register(UINib(nibName: "HouseWarmingDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "HouseWarmingDetailTableViewCell")
        
        // header
        tableView.register(UINib(nibName: "HouseWarmingDetailTableHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HouseWarmingDetailTableHeader")
        
        // API 호출
        HouseWarmingDetailDataManager().getHouseWarmingDetail(postNumber ?? 0, delegate: self)
    }
}



extension HouseWarmingDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let info = postInfo {
            if info.isExpert == 0 {
                return houseWarmingTitles.count
            }else {
                return expertTitles.count
            }
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HouseWarmingDetailTableViewCell", for: indexPath) as? HouseWarmingDetailTableViewCell else {
            return UITableViewCell()
        }
        if let info = postInfo {
            if info.isExpert == 0 {
                cell.updateCell(houseWarmingTitles[indexPath.row], data: info)
            }else {
                cell.updateCell(expertTitles[indexPath.row], data: info)
            }
        }
        
        return cell
    }
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HouseWarmingDetailTableHeader") as? HouseWarmingDetailTableHeader else {
            return UIView()
        }
        if let info = postInfo {
            headerView.updateCell(info)
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 1.25
    }
}
