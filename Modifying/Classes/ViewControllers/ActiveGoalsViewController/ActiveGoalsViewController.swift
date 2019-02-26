//
//  ViewController.swift
//  Modifying
//
//  Created by Eugenity on 26.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import SwipeCellKit
import MagicalRecord

class ActiveGoalsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var storedGoals: [StoredGoal] {
        get {
            return (StoredGoal.mr_findAll() as! [StoredGoal])
        }
    }
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ActiveGoalCell", bundle: nil), forCellWithReuseIdentifier: "ActiveGoalCell")
        
    }
    
    //MARK: Actions
    @IBAction func unwindToActiveGoalVC(segue:UIStoryboardSegue) {
        collectionView.reloadData()
    }
    
    @IBAction func addNewGoal(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddGoal", sender: self)
    }
    
}

extension ActiveGoalsViewController: SwipeCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            MagicalRecord.save({ (localContext) in
                let goal = self.storedGoals[indexPath.row]
                goal.mr_deleteEntity(in: localContext)
            }) { (success, error) in
                collectionView.reloadData()
            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
}

extension ActiveGoalsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGoalCell", for: indexPath) as! ActiveGoalCell
        let goal = storedGoals[indexPath.row]
        cell.goalLabel.text = goal.name
        cell.delegate = self as SwipeCollectionViewCellDelegate
        
        return cell
    }
}

extension ActiveGoalsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 68)
    }
}
