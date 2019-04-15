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
    /// - Parameters:
    ///   - child: ViewController that is being added as a child.
    ///   - viewHolder: If supplied child's view will be added as a subview into it. Otherwise - to the root view of the ViewController.
    func add(_ child: UIViewController, toViewHolder viewHolder: UIView? = nil) {
        addChild(child)
        viewHolder != nil ? viewHolder?.addSubview(child.view) : view.addSubview(child.view)
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
