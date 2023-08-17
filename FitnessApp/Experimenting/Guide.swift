//
//  Guide.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//

import SwiftUI

struct Guide: View {
    var body: some View {
        
        VStack {
            Image(systemName: Tab.doc.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text("Guide")
                .font(.title)
                .padding()
            VStack {
                Text("When logging an exercise to the calendar, You must first log the warm-up.")
                Text("Right after logging the warm-up you can log real exercises. If you go out of editing or see that an element is added without a name")
                Text("You must add the warm-up again, before logging the other exercises")
                Text("The empty/ nameless exercises you just logged can be deleted when you are done adding all exercises")
            }
            .padding(.horizontal)
            .frame(width: 380, alignment: .center)
        }
    }
}

struct Guide_Previews: PreviewProvider {
    static var previews: some View {
        Guide()
    }
}
