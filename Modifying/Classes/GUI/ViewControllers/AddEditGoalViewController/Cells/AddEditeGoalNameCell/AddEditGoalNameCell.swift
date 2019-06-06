//
//  AddEditGoalNameCell.swift
//  Modifying
//
//  Created by Eugenity on 24.10.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class AddEditGoalNameCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfHabitTextField: UITextField!
    
    //MARK: Cell Configuration Method
    func configureCell(_ nameOfHabit: String?) {
        if let nameOfHabit = nameOfHabit {
            nameOfHabitTextField.text = nameOfHabit
        }
    }
}
