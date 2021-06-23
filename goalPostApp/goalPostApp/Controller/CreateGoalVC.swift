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
    }
    
    @IBAction func longTermBtnPressed(_ sender: UIButton!) {
        
    }
    @IBAction func shortTermBtnPressed(_ sender: UIButton!) {
        
    }
    @IBAction func nextBtnPressed(_ sender: UIButton!) {
        
    }
    @IBAction func backBtnPressed(_ sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
