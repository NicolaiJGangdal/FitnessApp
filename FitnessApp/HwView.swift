//
//  HwView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct HwView: View {
    
    @AppStorage("homeRoutine") private var homeRoutineData: Data?
    @State private var homeRoutine: [String] = [
        "Warmup", "Burpees", "Handstand Push Ups", "Reverse Crunch", "Bycycle-Crunch", "Pistol Squat", "Push Ups", "Narrow Grip Push Ups", "Plank"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Full Body Workout")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text("Bodyweight")
                    .padding(.leading, 30)
                    .font(.title)
                    .foregroundColor(.white)
                
                HStack {
                    Button("Add Exercise") {
                        showingAlert.toggle()
                        print("Pressed")
                    }
                    .alert("Enter an Exercise", isPresented: $showingAlert) {
                        TextField("Enter list item", text: $newListItem)
                            .foregroundColor(.black)
                        Button("OK", action: submitRoutine)
                    }
                    
                    Spacer()
                    
                    EditButton()
                        .foregroundColor(.white)
                }
                // Gammel styling
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                //.padding(.horizontal,80)
                //.background() // This is to make the Footer seemless
                //Ny styling
                .foregroundColor(.white) //Changes the color of the buttons and the inputtext
                .fontWeight(.semibold)
                
                List {
                    ForEach(homeRoutine, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine)
                    .onMove { homeRoutine.move(fromOffsets: $0, toOffset: $1)}
                }
                /* New styling not working
                .padding(.top, 80)
                .frame(width:400)
                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                 */
                 // Gammel Styling
                .padding(.vertical)
                
                .listStyle(InsetGroupedListStyle()) // Set the list style to plain
                 
                
            }
            .onAppear {
                loadRoutine()
            }
            .onDisappear {
                saveRoutine()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine() {
        print("You entered \(newListItem)")
        homeRoutine.append(newListItem)
    }
    
    func deleteRoutine(indexSet: IndexSet) {
        homeRoutine.remove(atOffsets: indexSet)
    }
    
    func loadRoutine() {
        guard let savedData = homeRoutineData else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            homeRoutine = decodedData
        }
    }
    
    func saveRoutine() {
        if let encodedData = try? JSONEncoder().encode(homeRoutine) {
            homeRoutineData = encodedData
        }
    }
}

struct HwView_Previews: PreviewProvider {
    static var previews: some View {
        HwView()
    }
}
