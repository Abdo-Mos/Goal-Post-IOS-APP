//
//  FinishGoalVC.swift
//  goalPostApp
//
//  Created by Abdelrahman on 26.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController {
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGoalBtn.bindToKeyboard()
    }
    
    @IBAction func backBtnPressed() {
        dismissDetail()

    }
    
    fileprivate var goalDescription: String!
    fileprivate var goalType: GoalType!
    
    @IBAction func createGoalBtnPressed(_ sender: UIButton!) {
        
        // pass data into coreData Goal model
    }
    
    internal func initData(description: String, goalType: GoalType) {
        self.goalDescription = description
        self.goalType = goalType
    
    }
}
