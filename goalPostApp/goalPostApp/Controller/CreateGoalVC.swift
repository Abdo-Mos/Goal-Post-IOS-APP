//
//  CreateGoalVC.swift
//  goalPostApp
//
//  Created by Abdelrahman on 23.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpViewDidLoad()
    }
    
    fileprivate func setUpViewDidLoad() -> Void {
        nextBtn.bindToKeyboard()
        defaultGoalTypeSelection = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        
        goalTextView.delegate = self
    }

    fileprivate var defaultGoalTypeSelection: GoalType = .longTerm
    
    @IBAction func longTermBtnPressed(_ sender: UIButton!) {
        defaultGoalTypeSelection = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton!) {
        defaultGoalTypeSelection = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton!) {
        presentingFinishGoalVC()
    }
    
    fileprivate func presentingFinishGoalVC() -> Void {
        // initialize the data
        if goalTextView.text != "" && goalTextView.text != "Enter Your Goal Here." {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text, goalType: defaultGoalTypeSelection)
            // present the finishGoalVC
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton!) {
        dismissDetail()
    }
}

extension CreateGoalVC: UITextViewDelegate {
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if goalTextView.text == "Enter Your Goal Here." {
            goalTextView.text = ""
        }
        goalTextView.textColor = UIColor.black
    }
}
