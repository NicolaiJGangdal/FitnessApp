//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//

/*
import SwiftUI

struct CalendarTestView: View {
    @State private var selectedMonth = Date()
    @State private var selectedDate = Date()
    @State private var isShowingEventSheet = false
    @State private var events: [Event] = []
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth)!
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text(monthString(from: selectedMonth))
                    .font(.title)
                
                Button(action: {
                    selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth)!
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            VStack {
                ForEach(datesOfMonth().chunks(7), id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.self) { date in
                            Button(action: {
                                selectedDate = date
                                isShowingEventSheet = true
                            }) {
                                Text(dayString(from: date))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(date == currentDate() ? Color.blue.opacity(0.5) : Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                            }
                            .sheet(isPresented: $isShowingEventSheet) {
                                EventAddView(selectedDate: $selectedDate, events: $events)
                            }
                        }
                    }
                }
            }
            
            Spacer()
            //File2()
        }
    }
    
    func monthString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func dayString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
    
    func datesOfMonth() -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: selectedMonth)!
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedMonth))!
        return (0..<range.count).map { calendar.date(byAdding: .day, value: $0, to: firstDayOfMonth)! }
    }
    
    func currentDate() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        return calendar.date(from: components)!
    }
}

extension Array {
    func chunks(_ size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct Event: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let subtitle: String
}

struct EventAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedDate: Date
    @Binding var events: [Event]
    
    @State private var isAddingEvent = false
    @State private var eventTitle = ""
    @State private var eventSubtitle = ""
    
    var body: some View {
        VStack {
            Text(dateString(from: selectedDate))
                .font(.title)
                .padding()
            
            Spacer()
            //File2()

        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing: Button("Done") {
            presentationMode.wrappedValue.dismiss()
        })
    }
    
    func dateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}


struct CalendarTestView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTestView()
    }
}
*/
