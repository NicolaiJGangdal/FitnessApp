//
//  WorkoutDetailView3.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct WorkoutDetailView3: View {
    
    
    @AppStorage("subTitle3") var subTitle3: String = "Back"
    @AppStorage("routine3") private var routineData3: Data?
    @State private var routine3: [String] = [
        "Warmup", "Pullups", "Deadlift", "Bent-over barbell rows", "Seated machine rows", "Machine pulldowns", "Straight arm lat-pulldown", "Seated incline bicep-curls", "Seated hammer-curls", "Cable-curls"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Wednesday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle3)
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
                        Button("OK", action: submitRoutine3)
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
                    ForEach(routine3, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine3)
                    .onMove { routine3.move(fromOffsets: $0, toOffset: $1)}
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
                loadRoutine3()
            }
            .onDisappear {
                saveRoutine3()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine3() {
        print("You entered \(newListItem)")
        routine3.append(newListItem)
    }
    
    func deleteRoutine3(indexSet: IndexSet) {
        routine3.remove(atOffsets: indexSet)
    }
    
    func loadRoutine3() {
        guard let savedData = routineData3 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine3 = decodedData
        }
    }
    
    func saveRoutine3() {
        if let encodedData = try? JSONEncoder().encode(routine3) {
            routineData3 = encodedData
        }
    }
}

struct WorkoutDetailView3_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView3()
    }
}
