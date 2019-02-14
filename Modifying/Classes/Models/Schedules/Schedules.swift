//
//  Schedules.swift
//  Modifying
//
//  Created by Eugenity on 11.12.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation

protocol Schedule {
    var type: ScheduleType { get }
    var title: String { get set }
    var scheduleItems: [ScheduleItem] { get set }
    
    init()
}

enum ScheduleType {
    case partOfDay
    case daily
    case monthly
    case weekly
}

enum ScheduleFactory {
    static func options(for scheduleType: ScheduleType) -> Schedule? {
        switch scheduleType {
        case .daily:
            return DailySchedule()
        case .weekly:
            return WeeklySchedule()
        case .monthly:
            return MonthlySchedule()
        case .partOfDay:
            return PartOfTheDaySchedule()
        }
    }
}

class DailySchedule: Schedule {
    var type = ScheduleType.daily
    var title: String = "on these days"
    var scheduleItems: [ScheduleItem]
    
    private let titles = ["M", "T", "W", "T", "F", "S", "S", "Every day"]
    
    required init() {
        let scheduleItems = ScheduleItemFactory.scheduleItems(for: type, with: titles)
        self.scheduleItems = scheduleItems as [ScheduleItem]
    }
        
}

class WeeklySchedule: Schedule {
    var type = ScheduleType.weekly
    var title: String = "some days a week"
    var scheduleItems: [ScheduleItem]
    
    private let titles = ["1", "2", "3", "4", "5", "6", "once every two weeks"]
    
    required init() {
        let scheduleItems = ScheduleItemFactory.scheduleItems(for: type, with: titles)
        self.scheduleItems = scheduleItems as [ScheduleItem]
    }
}

class MonthlySchedule: Schedule {
    var type = ScheduleType.monthly
    var title: String = "at this time of month"
    var scheduleItems: [ScheduleItem]

    private let titles = ["start", "middle", "end", "whole month"]
    
    required init() {
        let scheduleItems = ScheduleItemFactory.scheduleItems(for: type, with: titles)
        self.scheduleItems = scheduleItems as [ScheduleItem]
    }
}

class PartOfTheDaySchedule: Schedule {
    var type = ScheduleType.partOfDay
    var title: String = "I will do it in the"
    var scheduleItems: [ScheduleItem]

    private let titles = ["morning", "afteroon", "evening", "onceAtAnyTime"]
    
    required init() {
        let scheduleItems = ScheduleItemFactory.scheduleItems(for: type, with: titles)
        self.scheduleItems = scheduleItems as [ScheduleItem]
    }
}
