//
//  ScheduleCell.swift
//  Modifying
//
//  Created by Eugenity on 26.11.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class ScheduleCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        view.backgroundColor = .clear
    }

    //MARK: Cell Configuration Method
    func configureCell(_ withText: String?, _ isChosen: Bool) {
        label.text = withText
        configureCellSelection(isChosen)
    }
    
    func configureCellSelection(_ isChosen: Bool) {
        view.backgroundColor = isChosen ? .darkGray : .lightGray
    }
    
}
