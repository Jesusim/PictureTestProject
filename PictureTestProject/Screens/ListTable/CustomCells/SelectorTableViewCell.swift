//
//  SelectorTableViewCell.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class SelectorTableViewCell: TextTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .darkGray
        // Initialization code
    }
    
    override func configure(data: DataClass) {
        textToLable = data.variants?[data.selectedId ?? 0].text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
