//
//  EventFormViewModel.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//


import Foundation

class EventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var note = ""
    @Published var sets = ""
    @Published var eventType: Event.EventType = .unspecified

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ event: Event) {
        date = event.date
        note = event.note
        sets = event.sets
        eventType = event.eventType
        id = event.id
    }

    var incomplete: Bool {
        note.isEmpty
    }
}

