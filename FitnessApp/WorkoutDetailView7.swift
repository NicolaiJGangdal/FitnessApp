//
//  WorkoutDetailView7.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 15/05/2023.
//


import SwiftUI

struct WorkoutDetailView7: View {
    
    
    @AppStorage("subTitle7") var subTitle7: String = "Rest"
    @AppStorage("routine7") private var routineData7: Data?
    @State private var routine7: [String] = [
        "Rest"
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        ZStack {
            
            Image("workoutPhoto8")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .padding(.bottom, 600)
            
            VStack(alignment: .leading) {
                
                Text("Sunday")
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(subTitle7)
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
                        Button("OK", action: submitRoutine7)
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
                    ForEach(routine7, id: \.self) { exercise in
                        Text(exercise)
                            .font(.body) // Set the font size to match File 1
                    }
                    .onDelete(perform: deleteRoutine7)
                    .onMove { routine7.move(fromOffsets: $0, toOffset: $1)}
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
                loadRoutine7()
            }
            .onDisappear {
                saveRoutine7()
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(width: 400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
    }
    
    func submitRoutine7() {
        print("You entered \(newListItem)")
        routine7.append(newListItem)
    }
    
    func deleteRoutine7(indexSet: IndexSet) {
        routine7.remove(atOffsets: indexSet)
    }
    
    func loadRoutine7() {
        guard let savedData = routineData7 else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routine7 = decodedData
        }
    }
    
    func saveRoutine7() {
        if let encodedData = try? JSONEncoder().encode(routine7) {
            routineData7 = encodedData
        }
    }
}

struct WorkoutDetailView7_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView7()
    }
}
