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
    
    fileprivate var defaultGoalType: GoalType = .longTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpViewDidLoad()
    }
    
    
    fileprivate func setUpViewDidLoad() {
        nextBtn.bindToKeyboard()
        defaultGoalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
        
        goalTextView.delegate = self
    }
    
    @IBAction func longTermBtnPressed(_ sender: UIButton!) {
        defaultGoalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    @IBAction func shortTermBtnPressed(_ sender: UIButton!) {
        defaultGoalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton!) {
        presentingFinishGoalVC()
    }
    
    fileprivate func presentingFinishGoalVC() {
        // initialize the data
        if goalTextView.text != "" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text, goalType: defaultGoalType)
            presentDetail(finishGoalVC)
        }
        // present the finishGoalVC
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton!) {
        dismissDetail()
    }
}

extension CreateGoalVC: UITextViewDelegate {
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = UIColor.black
    }
}
