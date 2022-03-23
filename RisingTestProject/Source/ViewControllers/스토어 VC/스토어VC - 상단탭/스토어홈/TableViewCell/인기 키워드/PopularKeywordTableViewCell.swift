//
//  PopularKeywordTableViewCell.swift
//  RisingTestProject
//
//  Created by 신동희 on 2022/03/22.
//

import UIKit

class PopularKeywordTableViewCell: UITableViewCell {
    
    // UI연결
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var label4: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCell(_ keywords: [PopularKeyword]) {
        image1.load(url: URL(string: keywords[0].keywordImg)!)
        label1.text = keywords[0].keyword
        
        image2.load(url: URL(string: keywords[1].keywordImg)!)
        label2.text = keywords[1].keyword

        image3.load(url: URL(string: keywords[2].keywordImg)!)
        label3.text = keywords[2].keyword

        image4.load(url: URL(string: keywords[3].keywordImg)!)
        label4.text = keywords[3].keyword

    }
}
