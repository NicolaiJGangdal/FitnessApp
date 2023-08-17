//
//  InfoLogger.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//





//Right format back from input-form, but still only get Curl-heading
import SwiftUI

struct InfoLogger: View {
    @State private var isFormPresented = false
    @State private var exercises: [ExerciseInfo] = []
    var list2 = [
        ExerciseData(id: 1, name: "Plank"),
        ExerciseData(id: 2, name: "Benchpress"),
        ExerciseData(id: 3, name: "Squat"),
        ExerciseData(id: 4, name: "Curls")
    ]

    
    var body: some View {
        VStack {
            Text("Here is my Info")
                .font(.title)
            
            List {
                ForEach(exercises, id: \.id) { exercise in
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                            .font(.headline)
                        Text("Sets: \(exercise.sets) | Reps: \(exercise.reps) | Weight: \(exercise.weight) Kg")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            // Second list to combine the two
            List {
                ForEach(list2, id: \.id) { exerciseData in
                    HStack {
                        Text(exerciseData.name)
                        Spacer()
                        Button(action: {
                            isFormPresented = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        .sheet(isPresented: $isFormPresented) {
                            ExerciseFormView(exerciseData: exerciseData) { exercise in
                                exercises.append(exercise)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ExerciseFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var sets = ""
    @State private var reps = ""
    @State private var weight = ""
    
    var onSave: (ExerciseInfo) -> Void
    var exerciseData: ExerciseData
    
    @State private var exerciseName: String
    
    public init(exerciseData: ExerciseData, onSave: @escaping (ExerciseInfo) -> Void) {
        self.exerciseData = exerciseData
        self.onSave = onSave
        self._exerciseName = State(initialValue: exerciseData.name)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Exercise", text: $exerciseName)
                TextField("Sets", text: $sets)
                    .keyboardType(.numberPad)
                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)
                TextField("Weight", text: $weight)
                    .keyboardType(.decimalPad)
                
                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Button("Save") {
                        let exercise = ExerciseInfo(name: exerciseName, sets: sets, reps: reps, weight: weight)
                        onSave(exercise)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add Exercise")
            .onAppear {
                exerciseName = exerciseData.name
            }
        }
    }
}

struct ExerciseData: Identifiable {
    let id: Int
    let name: String
}

struct ExerciseInfo: Identifiable {
    let id = UUID()
    let name: String
    let sets: String
    let reps: String
    let weight: String
}

struct InfoLogger_Previews: PreviewProvider {
    static var previews: some View {
        InfoLogger()
    }
}

