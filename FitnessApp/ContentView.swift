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
                        Text("For Beginners")
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
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                
               // Stack where the inner elements are arranged/ stacked horizontally
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(workouts) { workout in
                            //day card
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
    Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]),
    Workout(day: "Tuesday", muscleGroup: "Back", image: "workoutPhoto2", routine: ["Warmup, Pullups, deadlift, bent-over barbell rows, seated machine rows, machine pull-downs, straight arm lat-pulldown"]),
    Workout(day: "Wednesday", muscleGroup: "Legs", image: "workoutPhoto3", routine: ["Warmup, Squats, romanian-deadlifts, Split-squats, Leg-curls, Leg-extensions, Calf-raises"]),
    Workout(day: "Thursday", muscleGroup: "Shoulders", image: "workoutPhoto4", routine: ["Warmup, Arnold-press, Military-press, Lateral raises"]),
    Workout(day: "Friday", muscleGroup: "Arms", image: "workoutPhoto2", routine: ["Warmup, Chin-ups, tight grip bench-press, Dumbbell-rows, Triceps overhead dumbbell press"])
]

//var is indicative of some data that will be changed over time.
//let is indicative of some data that will not be changed.
//better to use let instead of var when declearing a variable, so that we don't just change things.
