//
//  EditMenuView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 10/05/2023.
//

import SwiftUI

struct EditMenuView: View {
    
    @AppStorage("fruits") private var fruitsData: Data?
    @State private var fruits: [String] = [
        "apple", "orange", "banana", "peach", "Watermelon",
    ]
    
    @AppStorage("animals") private var animalsData: Data?
    @State private var animals: [String] = [
        "dog", "cat", "giraffe",
    ]
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        NavigationView {
            List {
                
                 Section(
                 header: Text("Fruits")) {
                 
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit.capitalized)
                }
                
                .onDelete(perform: deleteFruits)
                .onMove { fruits.move(fromOffsets: $0, toOffset: $1)}
                
                }
                Section (
                    header: Text("Animals")) {
                        ForEach(animals, id: \.self) { animal in
                            Text(animal.capitalized)
                        }
                        
                        .onDelete(perform: deleteAnimals)
                        .onMove { animals.move(fromOffsets: $0, toOffset: $1)}
                    }
            }
            .toolbar {
                EditButton()
                Button("Add animal") {
                    showingAlert.toggle()
                    print("Pressed")
                }
                .alert("Enter an Animal", isPresented: $showingAlert) {
                    TextField("Enter list item", text: $newListItem)
                    Button("OK", action: submitAnimals)
                }
            }
            .navigationTitle("Handleliste")
        }
        .onAppear {
            loadFruits()
        }
        .onDisappear {
            saveFruits()
        }
        .onAppear {
            loadAnimals()
        }
        .onDisappear {
            saveAnimals()
        }
        //accentColor(.red)
    }
    
    
    func submitFruit() {
        print("You entered \(newListItem)")
        fruits.append(newListItem)
    }
    
    func submitAnimals() {
        print("You entered \(newListItem)")
        animals.append(newListItem)
    }
    
    func deleteFruits(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func deleteAnimals(indexSet: IndexSet) {
        animals.remove(atOffsets: indexSet)
    }
    
    func loadFruits() {
        guard let savedData = fruitsData else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            fruits = decodedData
        }
    }
    
    func saveFruits() {
        if let encodedData = try? JSONEncoder().encode(fruits) {
            fruitsData = encodedData
        }
    }
    
    func loadAnimals() {
        guard let savedData = animalsData else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            animals = decodedData
        }
    }
    
    func saveAnimals() {
        if let encodedData = try? JSONEncoder().encode(animals) {
            animalsData = encodedData
        }
    }
}

struct EditMEnuView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuView()
    }
}


/* How the onMove looked before using the func made below. Click cmd + left-click on "perform" for more info
 .onMove(perform: { indicies, newOffset in
     fruits.move(fromOffsets: indicies, toOffset: newOffset)
 })
*/
