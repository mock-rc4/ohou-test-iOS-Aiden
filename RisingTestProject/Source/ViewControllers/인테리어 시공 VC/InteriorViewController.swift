//
//  InteriorViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/28.
//

import UIKit


final class InteriorViewController: BaseViewController {
    
    // 게시글 정보
    var interiorPost: [InteriorPost] = []
    
    
    // UI 연결
    @IBOutlet weak var forRadiusView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tempView: UIView!
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRadiusToUIView(forRadiusView, size: forRadiusView.frame.height / 5)
        
        // table view setting
        tableView.delegate = self
        tableView.dataSource = self
        
        // header
        tableView.register(UINib(nibName: "InteriorTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "InteriorTableViewHeader")
        
        // cell
        tableView.register(UINib(nibName: "InteriorTableViewCell", bundle: nil), forCellReuseIdentifier: "InteriorTableViewCell")
        
        // 자동 높이 계산
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = tableView.frame.width * 0.75
        
        searchButton.addTarget(self, action: #selector(showSearchVC), for: .touchUpInside)
        
        
        // API호출
        InteriorPostDataManager().getInteriorPost(delegate: self)
    }
}



extension InteriorViewController: UITableViewDelegate, UITableViewDataSource {
    
    // cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !interiorPost.isEmpty {
            return interiorPost.count
        }else {
            return 3
        }
    }
    
    // 사용할 Cell 지정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InteriorTableViewCell", for: indexPath) as? InteriorTableViewCell else {
            return UITableViewCell()
        }
        if !interiorPost.isEmpty {
            cell.updateCell(interiorPost[indexPath.row])
        }
        
        return cell
    }
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InteriorTableViewHeader") as? InteriorTableViewHeader else {
            return UIView()
        }
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width
    }
}
