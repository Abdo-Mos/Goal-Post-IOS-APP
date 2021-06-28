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
    
    // public variables
    fileprivate var goals = Array<GoalEntity>()

    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDelegation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    fileprivate func fetchCoreDataObjects() -> Void {
        self.fetchData { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
//        tableView.reloadData()
    }
    
    @IBAction func addNewGoalPressed(_ sender: UIButton!) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {
            fatalError("Error instantiate CreateGoalsVC")
        }
        presentDetail(createGoalVC)
    }
    
}


// UITableView Methods Ext
extension GoalsVC: UITableViewDelegate, UITableViewDataSource {

    private func setUpDelegation() -> Void {
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    //MARK: - NOTES
    // For cellFOrRow at indexPath, this is where we're going to
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let goal = goals[indexPath.row]
        // - create a cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {
            return UITableViewCell()
        }
        // - configure it
            // - pass in some data
        cell.configureCell(goal: goal)
        // - return that cell to the tableView
        return cell
    }
    
    // enable tableView to swipe & edit cells
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // set the editing style of a particular tableViewCell
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // create the editing action so we can edit the cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // action to delete
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeData(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            // delete action
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
    }
    
}


// CoreData Methods Ext
extension GoalsVC {
    fileprivate func fetchData(completion:(_ complete: Bool) -> ()) -> Void {
        guard let mangedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<GoalEntity>(entityName: "GoalEntity")
        
        do {
            goals = try mangedContext.fetch(fetchRequest)
            print("Successfuly fetched data")
            completion(true)
            
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    fileprivate func removeData(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            print("Successfully removed goal") // debugging
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
}
