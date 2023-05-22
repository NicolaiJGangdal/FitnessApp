//
//  CustomTabBar.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case calendar
    case info
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".circle.fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .gray
        case .calendar:
            return .gray
        case .info:
            return .gray
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    selectedTab = .house
                }) {
                    Image(systemName: selectedTab == .house ? fillImage : Tab.house.rawValue)
                        .scaleEffect(selectedTab == .house ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == .house ? tabColor : .gray)
                        .font(.system(size: 22))
                }
                
                Spacer()
                
                Button(action: {
                    selectedTab = .calendar
                }) {
                    Image(systemName: selectedTab == .calendar ? fillImage : Tab.calendar.rawValue)
                        .scaleEffect(selectedTab == .calendar ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == .calendar ? tabColor : .gray)
                        .font(.system(size: 22))
                }
                
                Spacer()
                
                Button(action: {
                    selectedTab = .info
                }) {
                    Image(systemName: selectedTab == .info ? fillImage : Tab.info.rawValue)
                        .scaleEffect(selectedTab == .info ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == .info ? tabColor : .gray)
                        .font(.system(size: 22))
                }
                
                Spacer()
            }
            .frame(height: 80)
            .background(Color(.white))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(-10)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
