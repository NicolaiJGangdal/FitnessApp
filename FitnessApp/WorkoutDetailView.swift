//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.day)
                .padding(.leading, 30)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(workout.muscleGroup)
                .padding(.leading, 30)
                .font(.title)
            
            List(workout.routine, id: \.self) { exercise in
                Text(exercise)
            }
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]))
    }
}
