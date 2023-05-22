//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Text("Calendar")
                .font(.title)
                .padding(.top, 30)

            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
