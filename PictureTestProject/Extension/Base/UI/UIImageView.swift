//
//  UIImageView.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default")
            }
        }
    }
}
