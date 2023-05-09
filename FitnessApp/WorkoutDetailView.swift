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
            }
            .padding(.top, 80)
            .frame(width:400)
            .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
        }
        //.frame(width: 380, height: 300)
        //.cornerRadius(55)
        //.clipped()
        //.shadow(radius: 8)
        //.padding(.top, 20)
        //.padding()
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]))
    }
}
