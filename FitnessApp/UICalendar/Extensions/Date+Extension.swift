//
//  Date+Extension.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//


import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

