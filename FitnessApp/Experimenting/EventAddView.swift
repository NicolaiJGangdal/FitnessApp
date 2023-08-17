//
//  EventAddView.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//

import SwiftUI

struct EventAddView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @Binding var selectedDate: Date
    @Binding var events: [Event]
    
    @State private var eventTitle = ""
    @State private var sets = ""
    @State private var reps = ""
    @State private var weight = ""
    
    var body: some View {
        VStack {
            Text(dateString(from: selectedDate))
                .font(.title)
                .padding()
            
            TextField("Event Title", text: $eventTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            
            TextField("Sets", text: $sets)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            
            TextField("Reps", text: $reps)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            
            TextField("Weight", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            
            Button("Save") {
                onSave(eventTitle, sets, reps, weight, selectedDate)
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
        }
    }
    
    private func onSave(_ title: String, _ sets: String, _ reps: String, _ weight: String, _ date: Date) {
        let newItem = ListItem(title: title, sets: sets, reps: reps, weight: weight)
        
        if let index = events.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: date) }) {
            events[index].items.append(newItem)
        } else {
            let event = Event(date: date, items: [newItem])
            events.append(event)
        }
    }
}

struct EventAddView_Previews: PreviewProvider {
    static var previews: some View {
        EventAddView(selectedDate: .constant(Date()), events: .constant([]))
    }
}
