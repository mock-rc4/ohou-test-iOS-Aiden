//
//  AlignmentBottomSheetVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit


protocol ApiDelegate {
    func didTapAlignmentButton(_ filter: Int)
}


class AlignmentBottomSheetVC: BaseViewController {
    
    // API호출 delegate
    var delegate: ApiDelegate?
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    // 테이블뷰 셀 데이터
    var alignment: [String] = [
        "최신순", "최근인기순", "역대인기순", "과거순"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableview setting
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlignmentBottomSheetTableViewCell", bundle: nil), forCellReuseIdentifier: "AlignmentBottomSheetTableViewCell")
    }
}

extension AlignmentBottomSheetVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alignment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlignmentBottomSheetTableViewCell", for: indexPath) as? AlignmentBottomSheetTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(alignment[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTapAlignmentButton(indexPath.row + 1)
        self.dismiss(animated: true)
    }
}
