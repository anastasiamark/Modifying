//
//  ViewController.swift
//  Modifying
//
//  Created by Eugenity on 26.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class ActiveGoalsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ActiveGoalCell", bundle: nil), forCellWithReuseIdentifier: "ActiveGoalCell")
        
    }
    
    @IBAction func addNewGoal(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddGoal", sender: self)
    }
    
}

extension ActiveGoalsViewController: UICollectionViewDelegate {
    
}

extension ActiveGoalsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActiveGoalCell", for: indexPath)
        return cell
    }
}

extension ActiveGoalsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 68)
    }
}
