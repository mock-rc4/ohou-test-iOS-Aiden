//
//  SettingViewController.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit


final class SettingViewController: BaseViewController {
    
    // 세팅 정보 배열
    var settingArray: [[String]] = [
        ["프로필 수정",
         "맞춤정보 설정",
         "비밀번호 변경",
         "알림 설정",
         "자동 재생 설정",
         "내가 본 컨텐츠",
         "내 활동"],
        ["오늘의집이 궁금해요",
         "공지사항",
         "FAQ",
         "의견 보내기",
         "서비스 이용 약관",
         "개인정보처리방침",
         "버전 정보"],
        ["로그아웃"]
    ]
    
    
    // UI 연결
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTapPopButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 세팅
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = .zero
        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    // 탭바 설정
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}





// tableView Protocol 채택
extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.updateCell(settingArray[indexPath.section][indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingArray.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    // Header 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.systemGray5
        return view
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 프로필 수정
        if indexPath.section == 0 && indexPath.row == 0 {
            if Constant.isUserLogged {
                guard let modifyProfileVC = storyboard?.instantiateViewController(withIdentifier: "ModifyProfileViewController") as? ModifyProfileViewController else {
                    return
                }
                
                self.navigationController?.pushViewController(modifyProfileVC, animated: true)
            }else {
                presentAlert(title: "로그인 후 사용 가능합니다.")
            }
        }
        
        // 비밀번호 변경
        if indexPath.section == 0 && indexPath.row == 2 {
            if Constant.isUserLogged {
                guard let changePasswordVC = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController else {
                    return
                }
                
                self.navigationController?.pushViewController(changePasswordVC, animated: true)
            }else {
                presentAlert(title: "로그인 후 사용 가능합니다.")
            }
        }
        
        // 로그아웃
        if indexPath.section == 2 && indexPath.row == 0 {
            
            if Constant.isUserLogged {
                Constant.isUserLogged = false
                Constant.isUserTapLookAroundButton = true
                UserDefaults.standard.set("", forKey: "jwt")
                Constant.userInfo = nil
                Constant.userDidTapLogoutButton = true
                presentAlert(title: "로그아웃 되었습니다.")
            }else {
                presentAlert(title: "로그인 상태가 아닙니다.")
            }
        }
    }
    
}
