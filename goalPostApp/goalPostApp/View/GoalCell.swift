//
//  GoalCell.swift
//  goalPostApp
//
//  Created by Abdelrahman on 23.06.2021.
//  Copyright © 2021 Abdelrahman Sherif. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(Goaldescription description: String, GoalType type: String, goalProgressAmount amount: Int) {
        self.goalDescriptionLbl.text = description
        self.goalTypeLbl.text        = type
        self.goalProgressLbl.text    = String(amount)
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
