//
//  TextTableViewCell.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    func configure(data: DataClass)
}

class TextTableViewCell: UITableViewCell, ConfigurableCell {
    
    var textToLable : String? {
        didSet {
            textLabel?.text = self.textToLable
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .brown
        // Initialization code
    }
    
    func configure(data: DataClass) {
        textLabel?.text = data.text
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
