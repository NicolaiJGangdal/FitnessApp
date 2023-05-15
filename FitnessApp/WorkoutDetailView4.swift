//
//  WorkoutDetailView4.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct WorkoutDetailView4: View {
    
    
    @AppStorage("subTitle4") var subTitle4: String = "Shoulders"
    @AppStorage("routine4") private var routineData4: Data?
    @State private var routine4: [String] = [
        "Warmup", "Military press", "Arnold-press", "Lateral raises", "Bent over lateral raises", "Shrugs"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto5")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Thursday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle4)
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
                        Button("OK", action: submitRoutine4)
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
                    ForEach(routine4, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine4)
                    .onMove { routine4.move(fromOffsets: $0, toOffset: $1)}
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
                loadRoutine4()
            }
            .onDisappear {
                saveRoutine4()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine4() {
        print("You entered \(newListItem)")
        routine4.append(newListItem)
    }
    
    func deleteRoutine4(indexSet: IndexSet) {
        routine4.remove(atOffsets: indexSet)
    }
    
    func loadRoutine4() {
        guard let savedData = routineData4 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine4 = decodedData
        }
    }
    
    func saveRoutine4() {
        if let encodedData = try? JSONEncoder().encode(routine4) {
            routineData4 = encodedData
        }
    }
}

struct WorkoutDetailView4_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView4()
    }
}
