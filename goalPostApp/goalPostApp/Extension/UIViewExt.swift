//
//  UIViewExt.swift
//  goalPostApp
//
//  Created by Abdelrahman on 24.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

extension UIView {
    ///MARK: - Bind to keyboard Function Definition
    // Add an observer that's going to observe the notification that's sent when the keyboard changes frame, and that's a default IOS notification that is fired every time the keyboard opens.
    public func bindToKeyboard() {
        // - get the default notification center and add the observer
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    ///MARK: - Keyboard Will Change Function Definition
    // Going to go ahead and animate the frame of whatever object we bind the keyboard to so that it moves up with the keyboard in the exact same way.
    @objc public func keyboardWillChange(_ notification: NSNotification) {
        // - duration of the animation that the keyboard has when it moves.
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        // - the kind of animation curve that it use.
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        // - get the frame of the keyboard when it's below/above the screen.
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame   = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        // - going to find the difference of those so that we know how much to move up whatever the view that we bind to the keyboard.
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        // - animate
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
