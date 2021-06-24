//
//  UIViewControllerExt.swift
//  goalPostApp
//
//  Created by Abdelrahman on 23.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

//MARK: - NOTES
// An etension of UIViewController that's going to modify the way that ViewControllers are presented,
// it's going to make it easy for to emulate the animation style of a UINavigationController without needing to use one.
extension UIViewController {
    public func presentDetail(_ viewControllerToPresent: UIViewController) {
        // create a transition of type CATransition which comes form the coreAnimation Library.
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    // function to dismiss
    public func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
}
