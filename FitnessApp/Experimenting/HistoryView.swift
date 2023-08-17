//
//  HistoryView.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 24/05/2023.
//


/*
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
}

struct HistoryView: View {
    @State private var isAddingDate = false
    @State private var selectedDate = Date()
    @State private var events: [Event] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("History")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Button(action: {
                    isAddingDate = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                .padding(.bottom, 20)
                
                List {
                    ForEach(events) { event in
                        Text(event.title)
                    }
                }
            }
            .navigationTitle("History")
        }
        .sheet(isPresented: $isAddingDate, content: {
            NavigationView {
                Form {
                    Section(header: Text("Add a Date")) {
                        DatePicker(selection: $selectedDate, displayedComponents: .date) {
                            Text("Select a date")
                        }
                    }
                    
                    Section {
                        Button(action: {
                            addEvent()
                        }) {
                            Text("Save")
                        }
                        
                        Button(action: {
                            isAddingDate = false
                        }) {
                            Text("Cancel")
                        }
                    }
                }
                .navigationTitle("Add a Date")
            }
        })
        .onAppear {
            loadEventsFromStorage()
        }
    }
    
    private func addEvent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: selectedDate)
        
        let newEvent = Event(title: dateString)
        events.append(newEvent)
        
        isAddingDate = false
        
        saveEventsToStorage()
    }
    
    private func saveEventsToStorage() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(events)
            UserDefaults.standard.set(data, forKey: "SavedEvents")
        } catch {
            print("Failed to encode and save events: \(error)")
        }
    }
    
    private func loadEventsFromStorage() {
        guard let data = UserDefaults.standard.data(forKey: "SavedEvents") else { return }
        
        do {
            let decoder = JSONDecoder()
            events = try decoder.decode([Event].self, from: data)
        } catch {
            print("Failed to decode and load events: \(error)")
        }
    }
    
    /*
     func saveRoutine() {
         if let encodedData = try? JSONEncoder().encode(routine1) {
             routineData1 = encodedData
         }
     }
     
     func loadRoutine() {
         guard let savedData = routineData1 else { return }
         if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
             routine1 = decodedData
         }
     }
     */
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
*/




import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
}

struct HistoryView: View {
    @State private var isAddingDate = false
    @State private var selectedDate = Date()
    @State private var events: [Event] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("History")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Button(action: {
                    isAddingDate = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                .padding(.bottom, 20)
                
                List {
                    ForEach(events) { event in
                        Text(event.title)
                    }
                }
            }
            /*
            .navigationTitle("History")
             */
        }
        .sheet(isPresented: $isAddingDate, content: {
            NavigationView {
                Form {
                    Section(header: Text("Add a Date")) {
                        DatePicker(selection: $selectedDate, displayedComponents: .date) {
                            Text("Select a date")
                        }
                    }
                    
                    Section {
                        Button(action: {
                            addEvent()
                        }) {
                            Text("Save")
                        }
                        
                        Button(action: {
                            isAddingDate = false
                        }) {
                            Text("Cancel")
                        }
                    }
                }
                .navigationTitle("Add a Date")
            }
        })
    }
    
    private func addEvent() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: selectedDate)
        
        let newEvent = Event(title: dateString)
        events.append(newEvent)
        
        isAddingDate = false
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
/*
*/
