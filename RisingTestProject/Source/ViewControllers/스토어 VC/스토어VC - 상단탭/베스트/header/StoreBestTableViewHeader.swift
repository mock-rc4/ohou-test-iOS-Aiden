//
//  StoreBestTableViewHeader.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/25.
//

import UIKit

class StoreBestTableViewHeader: UITableViewHeaderFooterView {

    // MARK: - UI 연결
    
    // 실시간 베스트
    @IBOutlet weak var realTimeBestView: UIView!
    @IBOutlet weak var realTimeBestLabel: UILabel!
    
    // 역대 베스트
    @IBOutlet weak var historicalBestView: UIView!
    @IBOutlet weak var historicalBestLabel: UILabel!
    
    
    
    @IBAction func toggleBest(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selected(realTimeBestView, label: realTimeBestLabel)
            deselected(historicalBestView, label: historicalBestLabel)
        case 1:
            selected(historicalBestView, label: historicalBestLabel)
            deselected(realTimeBestView, label: realTimeBestLabel)
        default:
            return
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // border 설정
        realTimeBestView.layer.borderColor = UIColor.lightGray.cgColor
        realTimeBestView.layer.borderWidth = 1
        historicalBestView.layer.borderColor = UIColor.lightGray.cgColor
        historicalBestView.layer.borderWidth = 1
    }

    
    
    func selected(_ view: UIView, label: UILabel) {
        view.backgroundColor = UIColor.systemCyan
        label.textColor = UIColor.white
    }
    
    func deselected(_ view: UIView, label: UILabel) {
        view.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
    }
}
