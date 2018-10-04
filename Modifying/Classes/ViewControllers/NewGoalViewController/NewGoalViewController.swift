//
//  NewGoalViewController.swift
//  Modifying
//
//  Created by Eugenity on 28.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit


class NewGoalViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dynamicCellReuseIdentifier = "DynamicCell"
    private let topics = ["Health", "Fitness", "Home", "Hobbies", "Social", "Efficiency"] // Standard topics for goal's choice

    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: dynamicCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: dynamicCellReuseIdentifier)
    }
}

extension NewGoalViewController: UITableViewDelegate {

}

extension NewGoalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: dynamicCellReuseIdentifier, for: indexPath) as! DynamicCell
        if indexPath.row == 0 {
            cell.configureCell("Write my own", "Or choose from these topics")
        } else {
            cell.configureCell(topics[indexPath.row - 1], nil)
        }
        return cell
    }
    
    
}
