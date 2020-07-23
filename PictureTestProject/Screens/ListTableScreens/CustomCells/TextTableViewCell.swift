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
    
    var data: DataClass?
    var identifier : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .brown
    }
    
    func configure(data: DataClass) {
        self.data = data
        textLabel?.text = data.text
    }

}
