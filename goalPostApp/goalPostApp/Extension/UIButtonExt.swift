//
//  UIButtonExt.swift
//  goalPostApp
//
//  Created by Abdelrahman on 24.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

extension UIButton {
    public func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.5723371506, green: 0.8277098536, blue: 0.4667579532, alpha: 1)
    }
    
    public func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.7464011312, green: 0.8857318759, blue: 0.7402122021, alpha: 1)
    }
}
