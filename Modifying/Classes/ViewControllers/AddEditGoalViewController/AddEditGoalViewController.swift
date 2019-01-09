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
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneSetupForGoal)), animated: true)
    }
    
    @objc private func doneSetupForGoal() {
        if let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: ScheduleViewController.self)) as? ScheduleViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension AddEditGoalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addEditGoalNameCellReuseIdentifier, for: indexPath) as! AddEditGoalNameCell
        
        cell.configureCell(activeGoalName)
        cell.nameOfHabitTextField.delegate = self
        
        return cell
    }
}

extension AddEditGoalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44)
    }
}

extension AddEditGoalViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeGoalName = textField.text
        print("ActiveGoalName after textField editing: \(activeGoalName ?? "NO VALUE")")
    }
}
