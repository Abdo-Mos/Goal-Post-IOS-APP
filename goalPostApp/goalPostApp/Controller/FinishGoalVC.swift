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
        // pass user data into a new Goal model
        if pointsTextField.text != "" {
            self.saveData { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    fileprivate func saveData(completion: (_ finished: Bool) -> ()) -> Void {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        // create a goal model and give it a managedContext that it needs to know so that it knows where it's saving this data so it can be properly managed.
        let goalModel = GoalEntity(context: managedContext)
        goalModel.goalDescription = goalDescription
        goalModel.goalType = goalType.rawValue
        goalModel.goalCompletionValue = Int32(pointsTextField.text!)!
        goalModel.goalProgress = Int32(0)
        
        // pass this into persistent storage
        do {
            try managedContext.save()
            print("Successfully saved Data")
            completion(true)
        } catch {
            debugPrint("Could not save to persistent storage: \(error.localizedDescription)")
            completion(false)
        }
        
    }
    
    internal func initData(description: String, goalType: GoalType) -> Void {
        self.goalDescription = description
        self.goalType = goalType
    
    }
}
