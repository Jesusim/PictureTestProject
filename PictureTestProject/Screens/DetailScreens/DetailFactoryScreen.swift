//
//  DetailFactoryScreen.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import Foundation

class DetailFactoryScreen {
    
    var data: DataClass?
    
    init(data: DataClass?){
        self.data = data
    }
    
    func detailTextViewController() -> DetailTextViewController {
        let textDetailVC = DetailTextViewController()
        textDetailVC.setData(data: data)
        return textDetailVC
    }
    
    func detailPictureViewController() -> DetailPictureViewController {
        let pictureDetailVC = DetailPictureViewController()
        pictureDetailVC.setData(data: data)
        return pictureDetailVC
    }
    
    func detailAllVriantsTableViewController() -> DetailAllVriantsTableViewController {
        let sectorDetailVC = DetailAllVriantsTableViewController()
        sectorDetailVC.setData(data: data)
        return sectorDetailVC
    }
}
