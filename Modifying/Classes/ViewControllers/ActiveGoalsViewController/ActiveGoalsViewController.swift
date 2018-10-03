//
//  ViewController.swift
//  Modifying
//
//  Created by Eugenity on 26.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class ActiveGoalsViewController: UIViewController {

    @IBOutlet weak var activeGoalsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewGoal(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddGoal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddGoal" {
            
        }
    }


}

extension ActiveGoalsViewController: UITableViewDelegate {
    
}

extension ActiveGoalsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalCell
        cell.goalLabel.text = "My Goal!"
        return cell
    }
    
    
}
