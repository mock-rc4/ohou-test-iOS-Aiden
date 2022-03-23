//
//  HomePopularityVC.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//


import UIKit

class HomePopularityVC: BaseViewController {
    
    // API로 가져올 데이터
    var bannerImage: [UIImage] = [
        UIImage(named: "광고1.jpg")!,
        UIImage(named: "광고2.jpg")!
    ]
    
    
    
    
    
    // UI연결
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never

        
        tableView.register(UINib(nibName: "PopularityPostTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularityPostTableViewCell")
        tableView.register(UINib(nibName: "MainCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCategoryTableViewCell")
        tableView.register(UINib(nibName: "TodayDealTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayDealTableViewCell")
        tableView.register(UINib(nibName: "PopularityMediaTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularityMediaTableViewCell")
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        tableView.register(UINib(nibName: "ExhibitionTableViewCell", bundle: nil), forCellReuseIdentifier: "ExhibitionTableViewCell")
        
        
        // Header & Footer
        tableView.register(UINib(nibName: "PopularityTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PopularityTableViewHeader")
        tableView.register(UINib(nibName: "PopularityTableViewFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "PopularityTableViewFooter")
        
        
        
        BannersDataManager().getBannerImage(delegate: self)
    }
}



// MARK: - TableView Protocol 채택
extension HomePopularityVC: UITableViewDelegate, UITableViewDataSource {
    
    // Cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    // 사용할 Cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath로 구분하여 다른 Cell 반환하기
        if indexPath.row <= 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularityPostTableViewCell", for: indexPath) as? PopularityPostTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else if indexPath.row == 3{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCategoryTableViewCell", for: indexPath) as? MainCategoryTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodayDealTableViewCell", for: indexPath) as? TodayDealTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else if indexPath.row <= 6{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularityMediaTableViewCell", for: indexPath) as? PopularityMediaTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else if indexPath.row == 7{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as? ReviewTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExhibitionTableViewCell", for: indexPath) as? ExhibitionTableViewCell else {
                return UITableViewCell()
            }
            addSeparator(cell)
            return cell
        }
    }
    
    
    
    // 테이블뷰 셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row <= 2 {
            return tableView.frame.width * 1.5
        }else if indexPath.row == 3{
            return tableView.frame.width / 1.8
        }else if indexPath.row == 4{
            return tableView.frame.width / 1.3
        }else if indexPath.row <= 6 {
            return tableView.frame.width
        }else if indexPath.row == 7{
            return tableView.frame.width * 1.35
        }else {
            return tableView.frame.width * 2.3
        }
    }
    
    
    
    
    
    // 테이블뷰 Header 설정
    // Header에 사용할 view  return
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PopularityTableViewHeader") as? PopularityTableViewHeader else {
            return UIView()
        }
        headerView.imageArray = bannerImage
        headerView.commercialCollectionView.reloadData()
        return headerView
    }
    // header 높이값 주기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width * 0.85
    }
    
    
    // 테이블뷰 Footer 설정
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PopularityTableViewFooter") as? PopularityTableViewFooter else {
            return UIView()
        }
        return footerView
    }
    // Footer 높이값 주기
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return tableView.frame.width * 1.1
    }
}






// MARK: - Cell 구분선 커스텀
//extension HomePopularityVC {
//    func addSeparator(_ cell: UITableViewCell) {
//        let screenSize = UIScreen.main.bounds
//        let separatorHeight = CGFloat(5.0)
//        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
//        additionalSeparator.backgroundColor = UIColor.systemGray5
//        cell.addSubview(additionalSeparator)
//    }
//}
