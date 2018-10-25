//
//  HabitsViewController.swift
//  Modifying
//
//  Created by Eugenity on 22.10.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class HabitsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dynamicCellReuseIdentifier = String(describing: DynamicCell.self)

    var activeTitle = "Habits"
    // Standard habits for standard topics
    private let habitsForEachCategories = ["Health" : ["Eat a good meal", "Eat some fruit", "Drink some water", "Brush & floss", "Take medication", "Take vitamins", "Take a break", "Limit caffeine", "Check my posture"], "Fitness" : ["Hit the gym", "Go for a walk", "Go for a run", "Play some sport", "Go for a ride", "Go for a swim", "Yoga", "Stretching", "Crunches"], "Home" :["Water plants", "Pay bills", "Track my budget", "Make my bed", "Do the laundry", "Vacuum", "Cook dinner", "Walk the dog", "Put the bin out", "Gardening"], "Hobbies" : ["Meditate", "Read", "Cook something new", "Play an instrument", "Paint or draw", "Practice a new skill", "Watch a new film", "Write in my journal"], "Social" : ["Time with family", "Plan to see a friend", "Get out of the house", "Call mum or dad", "Say 'I love you'", "Talk to a stranger", "Plan to volunteer", "Listen more than talk"], "Efficiency" : ["Inbox zero", "Unclutter my life", "Study undistracted", "Sleep by 11pm", "Wake on time", "Write to-do list", "Practice focus", "Use Pomodoro timer"]]
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = activeTitle
        tableView.register(UINib(nibName: dynamicCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: dynamicCellReuseIdentifier)
    }

}

extension HabitsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var habitsCount = 1
        if let habits = habitsForEachCategories[activeTitle] {
            habitsCount = habits.count
        }
        return habitsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: dynamicCellReuseIdentifier, for: indexPath) as! DynamicCell
        if indexPath.row == 0 {
            cell.configureCell("Write my own", "Or choose from these topics")
        } else {
            if let habits = habitsForEachCategories[activeTitle] {
                cell.configureCell(habits[indexPath.row - 1], nil)
            }
        }
        return cell
    }
}

extension HabitsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: AddEditGoalViewController.self)) as? AddEditGoalViewController {
                vc.navigationItem.title = "Add Goal"
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: AddEditGoalViewController.self)) as? AddEditGoalViewController {
                vc.navigationItem.title = "Add Goal"
                if let habits = habitsForEachCategories[activeTitle] {
                    vc.activeGoalName = habits[indexPath.row - 1]
                }
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
