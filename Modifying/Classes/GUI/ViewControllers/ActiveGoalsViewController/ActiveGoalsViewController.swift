//
//  ViewController.swift
//  Modifying
//
//  Created by Eugenity on 26.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import SwipeCellKit
import MagicalRecord

class ActiveGoalsViewController: CoreDataViewController {
    
    
//    var storedGoals: [StoredGoal] {
//        get {
//            return (StoredGoal.mr_findAll() as! [StoredGoal])
//        }
//    }
    
    private var deleteAction: SwipeAction?
    
    internal override func createFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult>? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StoredGoal")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        let moc = NSManagedObjectContext.mr_default()
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }
    
    internal override func cellIdentifier() -> String {
        return "ActiveGoalCell"
    }
    
    internal override func configureCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? ActiveGoalCell {
            if let goal = self.fetchedResultsController?.object(at: indexPath) as? StoredGoal {
                //.....
                cell.goalLabel.text = goal.name
                cell.delegate = self as SwipeCollectionViewCellDelegate
            }
            
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
        
        guard orientation == .right else {
            
            let doneAction = SwipeAction(style: .default, title: "Done") { action, indexPath in
                print("Goal is reached!")
            }
            return [doneAction]
        }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") {[weak self] action, indexPath in
            
            // save delete action
            self?.deleteAction = action
            
            // handle action by updating model with deletion
            MagicalRecord.save({ (localContext) in
                if let goal = self?.fetchedResultsController?.object(at: indexPath) as? StoredGoal {
                    goal.mr_deleteEntity(in: localContext)
                }

            }) { (success, error) in

//                action.fulfill(with: .delete)
            }
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "delete")
        
        return [deleteAction]
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive(automaticallyDelete: false)
        options.transitionStyle = .border
        return options
    }
}

//extension ActiveGoalsViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return storedGoals.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGoalCell", for: indexPath) as! ActiveGoalCell
//        let goal = storedGoals[indexPath.row]
//        cell.goalLabel.text = goal.name
//        cell.delegate = self as SwipeCollectionViewCellDelegate
//
//        return cell
//    }
//}

extension ActiveGoalsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 68)
    }
}

extension ActiveGoalsViewController {
    override func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        if let deleteAction = deleteAction {
            deleteAction.fulfill(with: .delete)
        }
        
        collectionView.reloadData()
        deleteAction = nil
    }
}
