//
//  ContentView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .house:
                    Page1()
                case .calendar:
                    Page2()
                case .info:
                    Page3()
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                //Footer padding added to push the Footer further down
                    .padding(.bottom, -20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Page1: View {
    var body: some View {
        MainPage()
    }
}
   

struct Page2: View {
    var body: some View {
        
        File1()
        
        //CalendarView()
    }
}

struct Page3: View {
    var body: some View {
        File2()
        
        
        
        //InfoLogger()
        
        /* Old Info example site
        VStack {
            Image(systemName: Tab.info.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text(Tab.info.rawValue.capitalized)
                .font(.title)
                .padding()
        }
        */
    }
}
