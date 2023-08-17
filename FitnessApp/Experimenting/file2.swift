//
//  file2.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 23/05/2023.
//



//Issue with first element missing title. But all elements are now stored and are editable
import SwiftUI

struct ListItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let sets: String
    let reps: String
    let weight: String
}

class FullList: ObservableObject {
    static let shared = FullList()
    @Published private(set) var items: [ListItem] = []
    
    init() {
        loadItems()
    }
    
    func addItem(_ item: ListItem) {
        items.append(item)
        saveItems()
    }
    
    func deleteItem(at index: IndexSet) {
        items.remove(atOffsets: index)
        saveItems()
    }
    
    private func saveItems() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: "fullListItems")
        }
    }
    
    private func loadItems() {
        if let data = UserDefaults.standard.data(forKey: "fullListItems") {
            if let decodedItems = try? JSONDecoder().decode([ListItem].self, from: data) {
                items = decodedItems
            }
        }
    }
}

struct File2: View {
    @ObservedObject private var fullList = FullList.shared
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            
            Text("FILE 2")
                .font(.title)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(isEditing ? "Done" : "Edit")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal, 30)
            }
            
            List {
                ForEach(fullList.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text("Sets: \(item.sets) | Reps: \(item.reps) | Weight: \(item.weight) Kg")
                            .font(.subheadline)
                    }
                }
                .onDelete { indexSet in
                    fullList.deleteItem(at: indexSet)
                }
            }
            .padding(.vertical)
            .listStyle(InsetGroupedListStyle())
            
        }
        .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
    }
}

struct File2_Previews: PreviewProvider {
    static var previews: some View {
        File2()
    }
}

