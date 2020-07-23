//
//  DetailTextViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

protocol SetDetailView {
     func setData(data: DataClass?)
}

final class DetailTextViewController: UIViewController, SetDetailView {
    
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
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            titleLable.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: 0),
            titleLable.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: 0),
        ])
        
    }
    
    func setData(data: DataClass?) {
        titleLable.text = data?.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
