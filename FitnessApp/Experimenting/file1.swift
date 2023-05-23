//
//  file1.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//




//Issue with first element missing title. But all elements are now stored and are editable
import SwiftUI

struct FormView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var sets: String = ""
    @State private var reps: String = ""
    @State private var weight: String = ""
    
    var selectedDay: String?
    var onSave: (String, String, String, String) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Sets", text: $sets)
                TextField("Reps", text: $reps)
                TextField("Weight", text: $weight)
                
                Button("Save") {
                    onSave(selectedDay ?? "", sets, reps, weight)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("Add Subtitle")
        }
    }
}

struct File1: View {
    let weekList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State private var isFormPresented = false
    @State private var selectedDay: String?
    
    var body: some View {
        VStack {
            Text("FILE 1")
                .font(.title)
            
            List(weekList, id: \.self) { day in
                HStack {
                    Text(day)
                    Spacer()
                    Button(action: {
                        selectedDay = day
                        isFormPresented = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .sheet(isPresented: $isFormPresented, content: {
            FormView(selectedDay: selectedDay) { day, sets, reps, weight in
                // Save the data to File2
                let listItem = ListItem(title: day, sets: sets, reps: reps, weight: weight)
                FullList.shared.addItem(listItem)
            }
        })
    }
}

struct File1_Previews: PreviewProvider {
    static var previews: some View {
        File1()
    }
}

