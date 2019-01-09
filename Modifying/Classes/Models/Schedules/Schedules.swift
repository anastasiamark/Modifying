//
//  Schedules.swift
//  Modifying
//
//  Created by Eugenity on 11.12.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation

protocol OptionsForTheSchedule {
    func all() -> [String]
    func selected() -> [String]?
}

enum ScheduleType {
    case partOfTheDay
    case daily
    case monthly
    case weekly
}

enum ScheduleFactory {
    static func options(for scheduleType: ScheduleType) -> OptionsForTheSchedule? {
        switch scheduleType {
        case .daily:
            return DailySchedule()
        case .weekly:
            return WeeklySchedule()
        case .monthly:
            return MonthlySchedule()
        case .partOfTheDay:
            return PartOfTheDaySchedule()
        }
    }
}

class DailySchedule: OptionsForTheSchedule {
    private let dailyData = ["M", "T", "W", "T", "F", "S", "S", "Every day"]
    func all() -> [String] {
        return dailyData
    }
    
    func selected() -> [String]? {
        return [dailyData.last!]
    }
    
}

class WeeklySchedule: OptionsForTheSchedule {
    private let weeklyData = ["1", "2", "3", "4", "5", "6", "once every two weeks"]
    func all() -> [String] {
        return weeklyData
    }
    
    func selected() -> [String]? {
        return [weeklyData.last!]
    }
}

class MonthlySchedule: OptionsForTheSchedule {
    private let monthlyData = ["start", "middle", "end", "whole month"]
    func all() -> [String] {
        return monthlyData
    }
    
    func selected() -> [String]? {
        return [monthlyData.last!]
    }
}

class PartOfTheDaySchedule: OptionsForTheSchedule {
    private let partOfTheDayData = ["morning", "afteroon", "evening", "onceAtAnyTime"]
    func all() -> [String] {
        return partOfTheDayData
    }
    
    func selected() -> [String]? {
        return [partOfTheDayData.last!]
    }
}
