//
//  GoalsVC.swift
//  goalPostApp
//
//  Created by Abdelrahman on 22.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let test = GoalCell()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addNewGoalPressed(_ sender: UIButton!) {
        print(test.configureCell(Goaldescription: "One", GoalType: "Second", goalProgressAmount: 3))
    }


}

