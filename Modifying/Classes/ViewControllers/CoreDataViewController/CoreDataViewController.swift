//
//  CoreDataViewController.swift
//  Modifying
//
//  Created by Eugenity on 07.02.19.
//  Copyright © 2019 AnastasiaMark. All rights reserved.
//

import MagicalRecord
import UIKit

class CoreDataViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeFetchedResultsController()
    }
    
    func initializeFetchedResultsController() {
        
        self.fetchedResultsController = self.createFetchedResultsController()
        self.fetchedResultsController?.delegate = self
        
        if let frc = self.fetchedResultsController {
            do {
                try frc.performFetch()
            } catch {
                fatalError("Failed to initialize FetchedResultsController: \(error)")
            }
        }
    }
    
    internal func createFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult>? {
        return nil
    }
    
    internal func cellIdentifier() -> String {
        return "cellIdentifier"
    }
    
    internal func configureCell(cell: UICollectionViewCell, at indexPath: IndexPath) {
        // Override in subclasses
    }
}

extension CoreDataViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.fetchedResultsController?.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier(), for: indexPath)
        // Set up the cell
//        guard let object = self.fetchedResultsController?.object(at: indexPath) else {
//            fatalError("Attempt to configure cell without a managed object")
//        }
        //Populate the cell from the object
        
        self.configureCell(cell: cell, at: indexPath)
        
        return cell
    }
}

extension CoreDataViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        collectionView.
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
//        switch type {
//        case .insert:
//            collectionView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
//        case .delete:
//            collectionView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
//        case .move:
//            break
//        case .update:
//            break
//        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//        case .insert:
//            tableView.insertRows(at: [newIndexPath!], with: .fade)
//        case .delete:
//            tableView.deleteRows(at: [indexPath!], with: .fade)
//        case .update:
//            tableView.reloadRows(at: [indexPath!], with: .fade)
//        case .move:
//            tableView.moveRow(at: indexPath!, to: newIndexPath!)
//        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.collectionView.reloadData()
    }
}
