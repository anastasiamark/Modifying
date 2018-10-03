//
//  DynamicCell.swift
//  Modifying
//
//  Created by Eugenity on 28.09.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {
    
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

    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var disclosureImageView: UIImageView!
    
    @IBOutlet weak var imageViewBottomToSuperviewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomToExplanationLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        if !useExplanationLabel {
//            hideExplanationLabel()
//        } else {
//            showExplanationLabel()
//        }
//    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        imageViewBottomLowPriorityConstrain.isActive = true
//        imageViewHighPriorityConstraint.isActive = true
//    }
    
//    private func hideExplanationLabel() {
//        explanationLabel.isHidden = true
//        imageViewBottomLowPriorityConstrain.isActive = false
//        imageViewHighPriorityConstraint.isActive = true
//    }
    
//    private func showExplanationLabel() {
//        explanationLabel.isHidden = false
        //imageViewBottomLowPriorityConstrain.isActive = true
        //imageViewHighPriorityConstraint.isActive = false
//    }
    
}
