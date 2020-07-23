//
//  DetailViewController.swift
//  PictureTestProject
//
//  Created by Admin on 7/23/20.
//  Copyright © 2020 BadJesus. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var identifier : String?
    var detailFactoryScreen : DetailFactoryScreen?
    var data: DataClass? {
        didSet {
            detailFactoryScreen = DetailFactoryScreen(data: data)
        }
    }
    
    override func loadView() {
        super.loadView()
        
        setVCChildVC()
    }
    
    private func setVCChildVC() {
        
        switch identifier {
        case "CellText":
            guard let childVC = detailFactoryScreen?.detailTextViewController() else { return }
            configureChildViewController(childController: childVC, onView: view)
            navigationItem.title = data?.text
            
        case "CellPicture":
            guard let childVC = detailFactoryScreen?.detailPictureViewController() else { return }
            configureChildViewController(childController: childVC, onView: view)
            navigationItem.title = data?.text
            
        case "CellSelector":
            guard let childVC = detailFactoryScreen?.detailAllVriantsTableViewController() else { return }
            configureChildViewController(childController: childVC, onView: view)
            navigationItem.title = "\(data?.selectedId ?? 000)"
            
        default:
            break
        }
        
    }
    
}

extension DetailViewController {
    
    func configureChildViewController(childController: UIViewController, onView: UIView?) {
        var holderView = self.view
        if let onView = onView {
            holderView = onView
        }
        addChild(childController)
        holderView?.addSubview(childController.view)
        constrainViewEqual(holderView: holderView!, view: childController.view)
        childController.didMove(toParent: self)
    }


   fileprivate func constrainViewEqual(holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                    toItem: holderView, attribute: .top, multiplier: 1.0, constant: 0)
        let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                       toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let pinLeft = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal,
                                     toItem: holderView, attribute: .left, multiplier: 1.0, constant: 0)
        let pinRight = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal,
                                      toItem: holderView, attribute: .right, multiplier: 1.0, constant: 0)

        holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
    }
}

