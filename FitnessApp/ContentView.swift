//
//  ContentView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    let workouts = workoutsData
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                
                
                // Added this VStack and changed the name to NavigationLink
                // This is to redirect the element within to open
                NavigationLink(destination: Text("Coming Soon").font(.largeTitle)) {
                    //Main card view
                    ZStack {
                        Image("workoutPhoto1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height:250)
                        
                        
                        //Vertical Stack - where objects are stacked vertically
                        VStack {
                            
                            Spacer()
                            
                            Text("Full Body Workout")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("Bodyweight")
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .frame(width:400)
                        .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                    }
                    .frame(width: 380, height: 300)
                    .cornerRadius(55)
                    .clipped()
                    .shadow(radius: 8)
                    //.padding(.top, 20)
                .padding()
                }
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                
               // Stack where the inner elements are arranged/ stacked horizontally
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(workouts) { workout in
                            
                            //day card
                            NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                ZStack {
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height:220)
                                    
                                    //Vertical Stack - where objects are stacked vertically
                                    VStack {
                                        
                                        Spacer()
                                        
                                        Text(workout.day)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text(workout.muscleGroup)
                                            .fontWeight(.regular)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(width:150)
                                    .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                }
                                .frame(width: 150, height: 220)
                                .clipped()
                                .cornerRadius(20)
                                .shadow(radius: 8)
                            }
                        }
                    }
                    .padding()
                }
                .offset(x: 10, y: -30)

                Spacer()
            }
            .navigationBarTitle("Home Workouts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Workout: Identifiable {
    //Variable ID is being set to the returned unique identifier generated from the method UUID()
    var id = UUID()
    
    //Variable names with their respective types
    var day: String
    var muscleGroup: String
    var image: String
    var routine: [String]
}

let workoutsData = [
    Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup", "Bench Press", "Incline Dumbbell Press", "Cable-flies", "Skull-crushers", "Tricep-extensions rope", "Tricep-extensions bar"]),
    Workout(day: "Tuesday", muscleGroup: "Back", image: "workoutPhoto2", routine: ["Warmup", "Pullups", "Deadlift", "Bent-over barbell rows", "Seated machine rows", "Machine pulldowns", "Straight arm lat-pulldown", "Seated incline bicep-curls", "Seated hammer-curls", "Cable-curls"]),
    Workout(day: "Wednesday", muscleGroup: "Legs", image: "workoutPhoto5", routine: ["Warmup", "Squats", "Romanian-deadlifts", "Split-squats", "Leg-curls", "Leg-extensions", "Calf-raises", "Ab-machine", "Ab-routine"]),
    Workout(day: "Thursday", muscleGroup: "Shoulders", image: "workoutPhoto6", routine: ["Warmup", "Military press", "Arnold-press", "Lateral raises", "Bent over lateral raises", "Shrugs"]),
    Workout(day: "Friday", muscleGroup: "Arms", image: "workoutPhoto7", routine: ["Warmup", "Chin-ups", "Close-grip bench press", "Face down on incline bench bicep-curls", "Triceps overhead dumbbell press", "Standing hammer-curls", "Skull-crushers", "Cable-curls rope", "Tricep-extension rope", "Cable-curls bar", "Tricep-extensions bar"])
]

//var is indicative of some data that will be changed over time.
//let is indicative of some data that will not be changed.
//better to use let instead of var when declearing a variable, so that we don't just change things.
