//
//  WorkoutDetailView5.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct WorkoutDetailView5: View {
    
    
    @AppStorage("subTitle5") var subTitle5: String = "Arms"
    @AppStorage("routine5") private var routineData5: Data?
    @State private var routine5: [String] = [
        "Warmup", "Chin-ups", "Close-grip bench press", "Face down on incline bench bicep-curls", "Triceps overhead dumbbell press", "Standing hammer-curls", "Skull-crushers", "Cable-curls rope", "Tricep-extension rope", "Cable-curls bar", "Tricep-extensions bar"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto6")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Friday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle5)
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
                        Button("OK", action: submitRoutine5)
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
                    ForEach(routine5, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine5)
                    .onMove { routine5.move(fromOffsets: $0, toOffset: $1)}
                }
                /* New styling not working
                .padding(.top, 80)
                .frame(width:400)
                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                 */
                 // Gammel Styling
                .padding(.vertical)
                
                //Footer padding added to give the list space from the Footer
                .padding(.bottom, 100)
                .listStyle(InsetGroupedListStyle()) // Set the list style to plain
                 
                
            }
            .onAppear {
                loadRoutine5()
            }
            .onDisappear {
                saveRoutine5()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine5() {
        print("You entered \(newListItem)")
        routine5.append(newListItem)
    }
    
    func deleteRoutine5(indexSet: IndexSet) {
        routine5.remove(atOffsets: indexSet)
    }
    
    func loadRoutine5() {
        guard let savedData = routineData5 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine5 = decodedData
        }
    }
    
    func saveRoutine5() {
        if let encodedData = try? JSONEncoder().encode(routine5) {
            routineData5 = encodedData
        }
    }
}

struct WorkoutDetailView5_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView5()
    }
}
