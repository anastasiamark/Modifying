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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: Cell Configuration Method
    func configureCell(_ withText: String?) {
        if let text = withText {
            self.label.text = text
        }
    }
}
