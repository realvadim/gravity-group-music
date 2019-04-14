//
//  UIViewController+Extension.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Performs all the logic of adding a child ViewController.
    ///
    /// - Parameter child: ViewController that is being added as a child.
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    /// Performs all the logic of removing a child ViewController.
    func remove() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
