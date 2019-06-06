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
    
    private var chosenIndexes = IndexSet()
    private var defaultChosenIndex : Int {
        return (activeSchedule?.scheduleItems.count ?? 1) - 1
    }
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
        
        let idx = indexPath.row
                
            if chosenIndexes.contains(idx) {
                chosenIndexes.remove(idx)
                settingIndicesSelection(selectedIndex: idx)
                print(chosenIndexes.description)
            } else {
                chosenIndexes.insert(idx)
                settingIndicesSelection(selectedIndex: idx)
                print(chosenIndexes.description)
            }
        
        self.collectionView.reloadSections([0])
    }
    
    private func settingIndicesSelection(selectedIndex: Int) {
        
        chosenIndexes.remove(defaultChosenIndex)
        guard let scheduleType = activeSchedule?.type else {
            return
        }
        
        switch scheduleType {
        case .daily:

            if selectedIndex == defaultChosenIndex && chosenIndexes.count >= 1 {
                chosenIndexes.removeAll()
                chosenIndexes.insert(defaultChosenIndex)
            } else if chosenIndexes.contains(defaultChosenIndex) {
                chosenIndexes.remove(defaultChosenIndex)
            }
            
            if chosenIndexes.isEmpty {
                chosenIndexes.insert(defaultChosenIndex)
            }
            
            if chosenIndexes.contains(integersIn: IndexSet(integersIn: 0...defaultChosenIndex - 1)) {
                chosenIndexes.remove(integersIn: 0...defaultChosenIndex - 1)
                chosenIndexes.update(with: defaultChosenIndex)
            }
        case .weekly:
            simpleIndexSelection(selectedIndex)
        case .monthly:
            simpleIndexSelection(selectedIndex)
        case .partOfDay:
            simpleIndexSelection(selectedIndex)
        }
    }
    
    private func simpleIndexSelection(_ selectedIndex: Int) {
        if chosenIndexes.isEmpty {
            chosenIndexes.insert(defaultChosenIndex)
            return
        }
        
        let lastAddedIndex = selectedIndex
        chosenIndexes.removeAll()
        chosenIndexes.insert(lastAddedIndex)
    }
    
}

extension IntervalScheduleViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if chosenIndexes.isEmpty {
            chosenIndexes.insert(defaultChosenIndex)
        }
        return activeSchedule?.scheduleItems.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scheduleCellReuseIdentifier, for: indexPath) as! ScheduleCell
        if let scheduleItems = activeSchedule?.scheduleItems {
            let scheduleItem = scheduleItems[indexPath.item]
            cell.configureCell(scheduleItem.title, chosenIndexes.contains(indexPath.row))
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
