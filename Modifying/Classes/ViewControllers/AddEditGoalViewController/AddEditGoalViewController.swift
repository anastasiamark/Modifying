//
//  AddOrChangeGoalViewController.swift
//  Modifying
//
//  Created by Eugenity on 24.10.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class AddEditGoalViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var activeGoalName: String?
    
    private let addEditGoalNameCellReuseIdentifier = String(describing: AddEditGoalNameCell.self)
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: addEditGoalNameCellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: addEditGoalNameCellReuseIdentifier)
    }
}

extension AddEditGoalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addEditGoalNameCellReuseIdentifier, for: indexPath) as! AddEditGoalNameCell
        
        cell.configureCell(activeGoalName)
        
        return cell
    }
}

extension AddEditGoalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44)
    }
}
