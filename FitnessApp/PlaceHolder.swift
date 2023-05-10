//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

/*
import SwiftUI

struct WorkoutDetailView: View {
    
    @AppStorage("routines") private var routinesData: Data?
    @State private var routines: [String] = [
        "bench-press", "squats", "pushups",
    ]
    var workout: Workout
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        // Added this to get the image inside the DayCard
        ZStack {
            
            Image(workout.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:250)
                .padding(.bottom, 600)
            
            //Here is what gets displayed when you press a DayCard
            VStack(alignment: .leading) {
                
                //Spacer()
                
                Text(workout.day)
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(workout.muscleGroup)
                    .padding(.leading, 30)
                    .font(.title)
                    .foregroundColor(.white)
                
                List(workout.routine, id: \.self) { exercise in
                    Text(exercise)
                }
                .padding(.vertical)
                
                List {
                    ForEach(routines, id: \.self) { routine in
                        Text(routine.capitalized)
                    }
                    .onDelete(perform: deleteWorkout)
                    .onMove { routines.move(fromOffsets: $0, toOffset: $1)}
                    
                }
                .padding(.top, 80)
                .frame(width:400)
                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
            }
            .toolbar {
                EditButton()
                Button("Add Exercise") {
                    showingAlert.toggle()
                    print("Pressed")
                }
                .alert("Enter an Exercise", isPresented: $showingAlert) {
                    TextField("Enter list item", text: $newListItem)
                    Button("OK", action: submitWorkout)
                }
            }
            .navigationBarItems(leading: EditButton())
            // Edit liststyle here example: .listStyle(SidebarListStyle())
        }
        .onAppear {
            loadWorkouts()
        }
        .onDisappear {
            saveWorkouts()
        }
    }
    
    func submitWorkout() {
        print("You entered \(newListItem)")
        routines.append(newListItem)
    }
    
    func deleteWorkout(indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
    
    func loadWorkouts() {
        guard let savedData = routinesData else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routines = decodedData
        }
    }
    
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(routines) {
            routinesData = encodedData
        }
    }
    
    struct WorkoutDetailView_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutDetailView(workout: Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]))
        }
    }
    
}
*/
