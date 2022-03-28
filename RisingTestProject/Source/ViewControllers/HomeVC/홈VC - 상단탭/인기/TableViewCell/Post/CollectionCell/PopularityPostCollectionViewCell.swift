//
//  PopularityPostCollectionViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/19.
//

import UIKit

class PopularityPostCollectionViewCell: UICollectionViewCell {

    // UI 연결
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var scrapImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateCell(image: UIImage, title: String) {
        postImage.image = image
        postTitle.text = title
    }
    
    
    func updateCell(_ data: PopularityPost) {
        postImage.load(url: URL(string: data.houseImage)!)
        postTitle.text = data.title
        if data.isScrap == 1 {
            scrapImage.image = UIImage(systemName: "bookmark.fill")
        }
    }
}
