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
    
    var isChosen = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Cell Configuration Method
    func configureCell(_ withText: String?, _ isChosen: Bool) {
        if let text = withText {
            self.label.text = text
        }
        configureCellSelection(isChosen)
    }
    
    func configureCellSelection(_ isChosen: Bool) {
        if let view = self.viewWithTag(1) {
            if isChosen {
                self.isChosen = isChosen
                view.backgroundColor = .darkGray
            } else {
                self.isChosen = isChosen
                view.backgroundColor = .lightGray
            }
        }
    }
    
}
