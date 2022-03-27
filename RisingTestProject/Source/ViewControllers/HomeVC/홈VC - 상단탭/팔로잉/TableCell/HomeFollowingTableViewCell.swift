//
//  HomeFollowingTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/27.
//

import UIKit

class HomeFollowingTableViewCell: UITableViewCell {

    // UI 연결
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var scrapCount: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var linkCount: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ data: FollowingPost) {
        if let image = data.profile_Img {
            if !image.isEmpty {
                profileImage.load(url: URL(string: image)!)
            }
        }
        nickName.text = data.nickname
        postImage.load(url: URL(string: data.boardImg1)!)
        likeCount.text = "\(data.likeCnt)"
        scrapCount.text = "\(data.scrapCnt)"
        commentCount.text = "\(data.commentCnt)"
        linkCount.text = "\(data.linkCnt)"
        timeLabel.text = data.time
        content.text = data.contents
    }
}
