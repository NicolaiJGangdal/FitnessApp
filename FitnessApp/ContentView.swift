//
//  ContentView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
        .padding(.top, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
