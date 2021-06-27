//
//  GoalsVC.swift
//  goalPostApp
//
//  Created by Abdelrahman on 22.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit
import CoreData

// create an instance of our AppDelegate file, because when we create a project with CoreData all of the CoreData's methods are in the AppDelegate file.
/// This constant is accessible publicly across all of our VCs.
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegation()
    }
    
    @IBAction func addNewGoalPressed(_ sender: UIButton!) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            fatalError("Error instantiate CreateGoalsVC")
        }
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {

    private func setUpDelegation() -> Void {
        tableView.delegate   = self
        tableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //MARK: - NOTES
    // For cellFOrRow at indexPath, this is where we're going to
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // - create a cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            print(fatalError("Error Dequeuing GoalCell!"))
            return UITableViewCell()
        }
        // - configure it
        // - pass in some data
        cell.configureCell(Goaldescription: "Eatsaled", GoalType: .longTerm, goalProgressAmount: 3)
        // - return that cell to the tableView
        return cell
    }
}
