//
//  WorkoutDetailView6.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//

import SwiftUI

struct WorkoutDetailView6: View {
    
    
    @AppStorage("subTitle6") var subTitle6: String = "Cardio"
    @AppStorage("routine6") private var routineData6: Data?
    @State private var routine6: [String] = [
        "Warmup", "Running", "Stair-Machine", "Rowing", "Walking", "Hiking"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Saturday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle6)
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
                        Button("OK", action: submitRoutine6)
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
                    ForEach(routine6, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine6)
                    .onMove { routine6.move(fromOffsets: $0, toOffset: $1)}
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
                loadRoutine6()
            }
            .onDisappear {
                saveRoutine6()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine6() {
        print("You entered \(newListItem)")
        routine6.append(newListItem)
    }
    
    func deleteRoutine6(indexSet: IndexSet) {
        routine6.remove(atOffsets: indexSet)
    }
    
    func loadRoutine6() {
        guard let savedData = routineData6 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine6 = decodedData
        }
    }
    
    func saveRoutine6() {
        if let encodedData = try? JSONEncoder().encode(routine6) {
            routineData6 = encodedData
        }
    }
}

struct WorkoutDetailView6_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView6()
    }
}
