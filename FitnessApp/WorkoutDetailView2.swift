//
//  WorkoutDetailView2.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct WorkoutDetailView2: View {
    
    
    @AppStorage("subTitle2") var subTitle2: String = "Chest"
    @AppStorage("routine2") private var routineData2: Data?
    @State private var routine2: [String] = [
        "Warmup", "Bench Press", "Incline Dumbbell Press", "Cable-flies", "Skull-crushers", "Tricep-extensions rope", "Tricep-extensions bar"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Tuesday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle2)
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
                        Button("OK", action: submitRoutine2)
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
                    ForEach(routine2, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine2)
                    .onMove { routine2.move(fromOffsets: $0, toOffset: $1)}
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
                loadRoutine2()
            }
            .onDisappear {
                saveRoutine2()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine2() {
        print("You entered \(newListItem)")
        routine2.append(newListItem)
    }
    
    func deleteRoutine2(indexSet: IndexSet) {
        routine2.remove(atOffsets: indexSet)
    }
    
    func loadRoutine2() {
        guard let savedData = routineData2 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine2 = decodedData
        }
    }
    
    func saveRoutine2() {
        if let encodedData = try? JSONEncoder().encode(routine2) {
            routineData2 = encodedData
        }
    }
}

struct WorkoutDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView2()
    }
}
