//
//  MainScheduleView.swift
//  Modifying
//
//  Created by Eugenity on 15.11.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class MainScheduleView: UIView {
    
    @IBOutlet var dailyView: UIControl!
    @IBOutlet var weeklyView: UIControl!
    @IBOutlet var monthlyView: UIControl!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "\(MainScheduleView.self)", bundle: Bundle.main).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        performUIAdjustments()
    }
    
    //MARK: Actions
    @IBAction func handleTap(_ sender: UIControl) {
        
    }
    
    //MARK: Private
    private func performUIAdjustments() {
        if let dailyView = dailyView, let weeklyView = weeklyView, let monthlyView = monthlyView {
            roundCornersForViews([dailyView, weeklyView, monthlyView])
        }
    }
    
    private func roundCornersForViews(_ views: [UIView]) {
        for view in views {
            view.roundCorners()
        }
    }
    
}
