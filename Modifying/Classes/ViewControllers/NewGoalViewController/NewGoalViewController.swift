//
//  NewGoalViewController.swift
//  Modifying
//
//  Created by Eugenity on 28.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class NewGoalViewController: UIViewController {
    
    @IBOutlet weak var topicsTableView: UITableView!
    
    enum HabbitTopics: Int {
        case own
        case proposed
    }
    
    let topics = ["Health", "Fitness", "Home", "Habbies", "Social", "Efficiency"] // Standard topics for section "topic"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicsTableView.register(UINib(nibName: "DynamicCell", bundle: nil), forCellReuseIdentifier: "DynamicCell")

    }

}

extension NewGoalViewController: UITableViewDelegate {

}

extension NewGoalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DynamicCell", for: indexPath) as! DynamicCell
        if indexPath.row == 0 {
            cell.useExplanationLabel = true
            
            cell.goalLabel.text = "Write my own"
            cell.explanationLabel.text = "Or choose from these topics"
            cell.awakeFromNib()
        } else {
            cell.useExplanationLabel = false
            cell.goalLabel.text = topics[indexPath.row - 1]
            cell.awakeFromNib()
        }
        return cell
    }
    
    
}
