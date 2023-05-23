//
//  ExampleList.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//

import SwiftUI

struct ExampleList: View {
    var exercises = ["Plank", "Benchpress", "Squat", "Curls"]
    
    var body: some View {
        VStack {
            Text("Example List")
                .font(.title)
                .padding()
            
            List {
                ForEach(exercises, id: \.self) { exercise in
                    HStack {
                        Text(exercise)
                        Spacer()
                        Button(action: {
                            // Action to perform when the "+" button is tapped
                            // Add your desired functionality here
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}

struct ExampleList_Previews: PreviewProvider {
    static var previews: some View {
        ExampleList()
    }
}
