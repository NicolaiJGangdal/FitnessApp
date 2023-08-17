//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//

import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    @Binding var selectedMonth: Date
    @Binding var events: [Event]
    
    var body: some View {
        HStack {
            Button("<") {
                selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth) ?? Date()
            }
            .padding()
            
            Text(monthString(from: selectedMonth))
                .font(.title)
                .padding()
            
            Button(">") {
                selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth) ?? Date()
            }
            .padding()
        }
    }
    
    private func monthString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: .constant(Date()), selectedMonth: .constant(Date()), events: .constant([]))
    }
}
