//
//  NewGoalViewController.swift
//  Modifying
//
//  Created by Eugenity on 28.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit


class HabitsCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dynamicCellReuseIdentifier = String(describing: DynamicCell.self)
    
    // Standard topics for goal's choice
    private let categories = ["Health", "Fitness", "Home", "Hobbies", "Social", "Efficiency"]
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: dynamicCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: dynamicCellReuseIdentifier)
    }
    
}

extension HabitsCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0  {
            if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: AddEditGoalViewController.self)) as? AddEditGoalViewController {
                vc.navigationItem.title = "Add Goal"
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HabitsViewController") as? HabitsViewController {
                vc.activeTitle = categories[indexPath.row - 1]
                navigationController?.pushViewController(vc, animated: true)
            }
        } 
    }
}

extension HabitsCategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: dynamicCellReuseIdentifier, for: indexPath) as! DynamicCell
        if indexPath.row == 0 {
            cell.configureCell("Write my own", "Or choose from these topics")
        } else {
            cell.configureCell(categories[indexPath.row - 1], nil)
        }
        return cell
    }
    
    
}
