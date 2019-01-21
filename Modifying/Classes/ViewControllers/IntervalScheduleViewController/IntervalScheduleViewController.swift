//
//  DailyScheduleViewController.swift
//  Modifying
//
//  Created by Eugenity on 27.11.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit

class IntervalScheduleViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let scheduleCellReuseIdentifier = String(describing: ScheduleCell.self)
    private var activeSchedulType = ScheduleType.daily
    private var activeSchedule: Schedule?
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: scheduleCellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: scheduleCellReuseIdentifier)

    }
    
    //MARK: Functions
    func configureVCWith(_ scheduleType: ScheduleType) {
        switch scheduleType {
        case .daily:
            activeSchedulType = .daily
            activeSchedule = ScheduleFactory.options(for: .daily)
        case .monthly:
            activeSchedulType = .monthly
            activeSchedule = ScheduleFactory.options(for: .monthly)
        case .weekly:
            activeSchedulType = .weekly
            activeSchedule = ScheduleFactory.options(for: .weekly)
        case .partOfDay:
            activeSchedulType = .partOfDay
            activeSchedule = ScheduleFactory.options(for: .partOfDay)
        }
    }
}

extension IntervalScheduleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ScheduleCell
        
        collectionView.reloadData()
    }
}

extension IntervalScheduleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activeSchedule?.scheduleItems.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scheduleCellReuseIdentifier, for: indexPath) as! ScheduleCell
        if let scheduleItems = activeSchedule?.scheduleItems {
            let scheduleItem = scheduleItems[indexPath.item]
            print("IntervalScheduleViewController| chosenOptions:)")
            cell.configureCell(scheduleItem.title, true)
        }
        return cell
    }
}

extension IntervalScheduleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var elementsInTheFirstRow = 0
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        if let scheduleItems = activeSchedule?.scheduleItems {
            elementsInTheFirstRow = scheduleItems.count - 1
            
        }
        var width = collectionView.bounds.width/CGFloat(elementsInTheFirstRow) - flowLayout.minimumInteritemSpacing
        if indexPath.item == elementsInTheFirstRow {
            width = collectionView.bounds.width
        }
        let height =  CGFloat(50) //ratio
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

}
