//
//  ScheduleType.swift
//  Modifying
//
//  Created by Eugenity on 17.01.19.
//  Copyright © 2019 AnastasiaMark. All rights reserved.
//

import Foundation


protocol ScheduleItem {
    var scheduleType: ScheduleType { get }
    var title: String { get set }
    init(_ title: String)
}

enum ScheduleItemFactory {
    static func scheduleItem(for scheduleType: ScheduleType, with title: String) -> ScheduleItem? {
        switch scheduleType {
        case .daily:
            return DailyItem(title)
        case .weekly:
            return WeeklyItem(title)
        case .monthly:
            return MonthlyItem(title)
        case .partOfDay:
            return PartOfDayItem(title)
        }
    }
    static func scheduleItems(for scheduleType: ScheduleType, with titles: [String]) -> [ScheduleItem?] {
        var array: [ScheduleItem] = []
        switch scheduleType {
        case .daily:
            for title in titles {
                let item = DailyItem(title)
                array.append(item)
            }
            return array
        case .weekly:
            for title in titles {
                let item = WeeklyItem(title)
                array.append(item)
            }
            return array
        case .monthly:
            for title in titles {
                let item = MonthlyItem(title)
                array.append(item)
            }
            return array
        case .partOfDay:
            for title in titles {
                let item = PartOfDayItem(title)
                array.append(item)
            }
            return array
        }
    }
}


class DailyItem: ScheduleItem {
    var scheduleType = ScheduleType.daily
    var title: String
    
    required init(_ title: String) {
        self.title = title
    }
}

class WeeklyItem: ScheduleItem {
    var scheduleType = ScheduleType.weekly
    var title: String
    
    required init(_ title: String) {
        self.title = title
    }
}

class MonthlyItem: ScheduleItem {
    var scheduleType = ScheduleType.monthly
    var title: String
    
    required init(_ title: String) {
        self.title = title
    }
}

class PartOfDayItem: ScheduleItem {
    var scheduleType = ScheduleType.partOfDay
    var title: String
    
    required init(_ title: String) {
        self.title = title
    }
}

