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
    //case stopwatch
    case lasso
    case doc
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ""
    }
    
    private var fillImage2: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .gray
        case .calendar:
            return .gray
        case .lasso:
            return .gray
        case .doc:
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
                    Image(systemName: selectedTab == .house ? fillImage2 : Tab.house.rawValue)
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
                    selectedTab = .lasso
                }) {
                    Image(systemName: selectedTab == .lasso ? fillImage2 : Tab.lasso.rawValue)
                        .scaleEffect(selectedTab == .lasso ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == .lasso ? tabColor : .gray)
                        .font(.system(size: 22))
                }
                
                Spacer()
                
                Button(action: {
                    selectedTab = .doc
                }) {
                    Image(systemName: selectedTab == .doc ? fillImage2 : Tab.doc.rawValue)
                        .scaleEffect(selectedTab == .doc ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == .doc ? tabColor : .gray)
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
