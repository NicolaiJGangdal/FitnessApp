//
//  Event.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//


import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .work:
                return "🏦"
            case .home:
                return "🏡"
            case .social:
                return "🎉"
            case .sport:
                return "🏟"
            case .unspecified:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var sets: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String, sets: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.sets = sets
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .home, date: Date().diff(numDays: 0), note: "Take dog to groomers", sets: "4"),
            Event(date: Date().diff(numDays: -1), note: "Get gift for Emily", sets: "5"),
            Event(eventType: .home, date: Date().diff(numDays: 6), note: "File tax returns.", sets: "6"),
            Event(eventType: .social, date: Date().diff(numDays: 2), note: "Dinner party at Dave and Janet's", sets: "7"),
            Event(eventType: .work, date: Date().diff(numDays: -1), note: "Complete Audit.", sets: "8"),
            Event(eventType: .sport, date: Date().diff(numDays: -3), note: "Football Game", sets: "9"),
            Event(date: Date().diff(numDays: -4), note: "Plan for winter vacation.", sets: "3")
        ]
    }
}

