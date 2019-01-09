//
//  UIView.swift
//  Modifying
//
//  Created by Eugenity on 08.11.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

// MARK: - Additions

extension UIView {
    
    func addSubview(_ subview: UIView, constrainedTo anchorsView: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([subview.centerXAnchor.constraint(equalTo: anchorsView.centerXAnchor),
                                     subview.centerYAnchor.constraint(equalTo: anchorsView.centerYAnchor),
                                     subview.widthAnchor.constraint(equalTo: anchorsView.widthAnchor),
                                     subview.heightAnchor.constraint(equalTo: anchorsView.heightAnchor)])
    }
    
    func roundCorners() {
        layer.masksToBounds =  true
        let radius = bounds.maxX / 12
        layer.cornerRadius = radius
    }
}
