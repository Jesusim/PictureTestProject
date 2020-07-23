//
//  PictureTableViewCell.swift
//  PictureTestProject
//
//  Created by Admin on 7/22/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class PictureTableViewCell: TextTableViewCell {
    
    private let pictureToView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .darkText
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(pictureToView)
        addSubview(titleLable)
        setConstraints()
        backgroundColor = .blue
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            pictureToView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            pictureToView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: 0),
            pictureToView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 0),
            
            pictureToView.heightAnchor.constraint(equalToConstant: 50),
            pictureToView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLable.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            titleLable.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: 0),
            
            titleLable.leftAnchor.constraint(equalTo: pictureToView.layoutMarginsGuide.rightAnchor, constant: 20),
            titleLable.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: 0),
            
        ])
        
    }
    
    override func configure(data: DataClass) {
        self.data = data
        titleLable.text = data.text
        self.pictureToView.setCustomImage(data.url)
    }
    
}
