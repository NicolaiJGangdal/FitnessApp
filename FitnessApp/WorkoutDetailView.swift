//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//


import SwiftUI

struct WorkoutDetailView: View {
    
    @State var workout: Workout
    
    @State private var showingAlert = false
    @State private var newExercise = ""
    
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
                
                HStack {
                    Button("Add Exercise") {
                        showingAlert = true
                    }
                    .alert("Enter an Exercise", isPresented: $showingAlert) {
                        TextField("Enter exercise", text: $newExercise)
                            .foregroundColor(.black)
                        Button("OK", action: addExercise)
                    }
                    
                    Spacer()
                    
                    EditButton()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                //.padding(.horizontal,80)
                //.background() // This is to make the Footer seemless
                .foregroundColor(.white) //Changes the color of the buttons and the inputtext
                .fontWeight(.semibold)
                
                List {
                    ForEach(workout.routine, id: \.self) { exercise in
                        Text(exercise)
                    }
                    .onDelete(perform: deleteExercise)
                }
                .padding(.vertical)
                


            }
            .padding(.top, 80)
            .frame(width:400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
            
            // Edit liststyle here example: .listStyle(SidebarListStyle())
        }
    }
    
    func addExercise() {
        print("You entered \(newExercise)")
        workout.routine.append(newExercise)
        /*
        workout.routine.apped(newExercise)
        newExercise = ""
         */
    }
    
    func deleteExercise(indexSet: IndexSet) {
        workout.routine.remove(atOffsets: indexSet)
    }
    
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]))
    }
}



/*
 Here is a button with two texts to give it a black outline
 
 Button(action: {
     showingAlert = true
 }) {
     Text("Add Exercise")
         .foregroundColor(.black)
         .fontWeight(.semibold)
         .overlay(
             Text("Add Exercise")
                 .foregroundColor(.white)
                 .offset(x: -1, y: -1) // Offset the black text slightly to create an outline effect
         )
 }
 */
