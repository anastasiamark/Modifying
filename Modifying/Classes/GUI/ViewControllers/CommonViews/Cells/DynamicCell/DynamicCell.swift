//
//  DynamicCell.swift
//  Modifying
//
//  Created by Eugenity on 28.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var disclosureImageView: UIImageView!
    
    @IBOutlet weak var imageViewBottomToSuperviewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomToExplanationLabelTopConstraint: NSLayoutConstraint!
    
    var useExplanationLabel = true {
        didSet {
            if useExplanationLabel {
                imageViewBottomToSuperviewBottomConstraint.priority = UILayoutPriority(500)
                imageViewBottomToExplanationLabelTopConstraint.priority = UILayoutPriority(999)
            } else {
                imageViewBottomToSuperviewBottomConstraint.priority = UILayoutPriority(999)
                imageViewBottomToExplanationLabelTopConstraint.priority = UILayoutPriority(500)
            }
            self.explanationLabel.isHidden = !useExplanationLabel
        }
    }

    //MARK: Cell Configuration Method
    func configureCell(_ goalLabelText: String?, _ explanationLabelText: String?) {
        if let explanationText = explanationLabelText, let goalText = goalLabelText {
            self.useExplanationLabel = true
            self.explanationLabel.text = explanationText
            self.goalLabel.text = goalText
        } else if let goalText = goalLabelText {
            self.useExplanationLabel = false
            self.goalLabel.text = goalText
        }
    }
    
}
