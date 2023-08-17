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
            
            /*
            Image("gymBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            */
            VStack {
                switch selectedTab {
                case .house:
                    Page1()
                case .calendar:
                    Page2()
                case .lasso:
                    Page3()
                case .doc:
                    Page4()
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
        
        //InfoLogger()
        //File2()
        //CalendarTestView()
        HistoryView()
    }
}

struct Page3: View {
    var body: some View {
        File1()
        
        //InfoLogger()
        
    }
}

struct Page4: View {
    var body: some View {

        //Guide()
        File2()
    }
}

