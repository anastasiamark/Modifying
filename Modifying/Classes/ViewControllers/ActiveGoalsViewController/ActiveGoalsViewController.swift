//
//  ViewController.swift
//  Modifying
//
//  Created by Eugenity on 26.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit
import MagicalRecord

class ActiveGoalsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    override var fetchRequest: NSFetchRequest<NSFetchRequestResult>! {
//        get {
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StoredGoal")
//
//            let predicate = NSPredicate(format: "isDone == %hhd", false)
//            fetchRequest.predicate = predicate
//
//            // sort by item text
//            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//            fetchRequest.sortDescriptors = [sortDescriptor]
//
//            return fetchRequest
//        }
//        set {
//
//        }
//    }
    
    var storedGoals: [StoredGoal] {
        get {
            return (StoredGoal.mr_findAll() as! [StoredGoal])
        }
    }
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ActiveGoalCell", bundle: nil), forCellWithReuseIdentifier: "ActiveGoalCell")
//        do {
//            try fetchedResultsController.performFetch()
//        } catch {
//            print(error)
//        }
    }
    //MARK: Actions
    @IBAction func unwindToActiveGoalVC(segue:UIStoryboardSegue) {
        collectionView.reloadData()
    }
    
    @IBAction func addNewGoal(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddGoal", sender: self)
    }
    
}

extension ActiveGoalsViewController: UICollectionViewDelegate {
    
}

extension ActiveGoalsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGoalCell", for: indexPath) as! ActiveGoalCell
//        if let storedGoals = storedGoals {
            let goal = storedGoals[indexPath.row]
//        let goal = fetchedResultsController.object(at: indexPath) as! StoredGoal
            cell.goalLabel.text = goal.name
//        }
    
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
