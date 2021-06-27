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
    internal func presentDetail(_ viewControllerToPresent: UIViewController) -> Void {
        // create a transition of type CATransition which comes form the coreAnimation Library.
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    // function that's going to dismiss createGoalVC and then instantiate the new VC from GoalsVC, so when we dismiss to create our goal at the end it'll dismiss all the way down to the GoalsVC.
    internal func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) -> Void {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        
        // constant to hold the VC that is presented by this VC.
        guard let presentedViewController = presentedViewController else { return }
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    // dismiss function
    internal func dismissDetail() -> Void{
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
}
