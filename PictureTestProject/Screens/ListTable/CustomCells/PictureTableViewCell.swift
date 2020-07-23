//
//  PictureTableViewCell.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class PictureTableViewCell: TextTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         backgroundColor = .blue
    }
    
    override func configure(data: DataClass) {
        
        textToLable = data.text
        
        DispatchQueue.main.async {
             if let url = URL(string: data.url ?? "LoadError"),
                let data = try? Data(contentsOf: url)  {
                
                self.imageView?.image =  UIImage(data: data as Data)
                self.imageView?.isHidden = false
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
