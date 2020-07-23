//
//  DetailPictureViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

class DetailPictureViewController: UIViewController, SetDetailView {
    
    private var data : DataClass? {
        didSet {
            titleLable.text = data?.text
        }
    }
    
    private let pictureToView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .darkText
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textAlignment = .center
        return lable
    }()
    
    override func loadView() {
        super.loadView()
        
        addAllSubViewInView()
    }
    
    private func addAllSubViewInView() {
        view.addSubview(titleLable)
        view.addSubview(pictureToView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            pictureToView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pictureToView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pictureToView.widthAnchor.constraint(equalToConstant: 100),
            pictureToView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLable.topAnchor.constraint(equalTo: pictureToView.layoutMarginsGuide.bottomAnchor, constant: 20),
            titleLable.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 0),
            titleLable.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 0),
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setData(data: DataClass?) {
        self.data = data
        self.pictureToView.setCustomImage(data?.url)
    }
    
}
