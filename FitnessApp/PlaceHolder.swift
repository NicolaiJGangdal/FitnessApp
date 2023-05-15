//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Nicolai Jensen Gangdal on 08/05/2023.
//

/*
import SwiftUI

struct WorkoutDetailView: View {
    
    @AppStorage("routines") private var routinesData: Data?
    @State private var routines: [String] = [
        "bench-press", "squats", "pushups",
    ]
    var workout: Workout
    
    @State private var showingAlert = false
    @State private var newListItem = ""
    
    var body: some View {
        
        // Added this to get the image inside the DayCard
        ZStack {
            
            Image(workout.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:250)
                .padding(.bottom, 600)
            
            //Here is what gets displayed when you press a DayCard
            VStack(alignment: .leading) {
                
                //Spacer()
                
                Text(workout.day)
                    .padding(.leading, 30)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(workout.muscleGroup)
                    .padding(.leading, 30)
                    .font(.title)
                    .foregroundColor(.white)
                
                List(workout.routine, id: \.self) { exercise in
                    Text(exercise)
                }
                .padding(.vertical)
                
                List {
                    ForEach(routines, id: \.self) { routine in
                        Text(routine.capitalized)
                    }
                    .onDelete(perform: deleteWorkout)
                    .onMove { routines.move(fromOffsets: $0, toOffset: $1)}
                    
                }
                .padding(.top, 80)
                .frame(width:400)
                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
            }
            .toolbar {
                EditButton()
                Button("Add Exercise") {
                    showingAlert.toggle()
                    print("Pressed")
                }
                .alert("Enter an Exercise", isPresented: $showingAlert) {
                    TextField("Enter list item", text: $newListItem)
                    Button("OK", action: submitWorkout)
                }
            }
            .navigationBarItems(leading: EditButton())
            // Edit liststyle here example: .listStyle(SidebarListStyle())
        }
        .onAppear {
            loadWorkouts()
        }
        .onDisappear {
            saveWorkouts()
        }
    }
    
    func submitWorkout() {
        print("You entered \(newListItem)")
        routines.append(newListItem)
    }
    
    func deleteWorkout(indexSet: IndexSet) {
        routines.remove(atOffsets: indexSet)
    }
    
    func loadWorkouts() {
        guard let savedData = routinesData else { return }
        if let decodedData = try? JSONDecoder().decode([String].self, from: savedData) {
            routines = decodedData
        }
    }
    
    func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(routines) {
            routinesData = encodedData
        }
    }
    
    struct WorkoutDetailView_Previews: PreviewProvider {
        static var previews: some View {
            WorkoutDetailView(workout: Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto4", routine: ["Warmup, Benchpress, incline dumbbell press, cable-flys"]))
        }
    }
    
}
*/


// ContentView --> Versjon -> Den har edit knapp som lager uppercase
/*
 import SwiftUI

 struct ContentView: View {
     
     @State private var isEditing = false
     @State private var editDayIndex: Int?
     @State private var editMuscleGroupIndex: Int?
     @State var workouts = workoutsData
     
     var body: some View {
         
         NavigationView {
             
             VStack(alignment: .leading) {
                 
                 
                 // Added this VStack and changed the name to NavigationLink
                 // This is to redirect the element within to open
                 NavigationLink(destination: Text("Coming Soon").font(.largeTitle)) {
                     //Main card view
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
                             Text("Bodyweight")
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
                     //.padding(.top, 20)
                     .padding()
                 }
                 
                 HStack {
                     Text("Weekly Plan")
                         .font(.largeTitle)
                         .fontWeight(.semibold)
                         .padding()
                     Spacer()
                     Button(action: {
                         isEditing.toggle()
                         editDayIndex = nil // Reset the edited day index
                         editMuscleGroupIndex = nil // Reset the edited day index
                     }, label: {
                         Text("Edit")
                     })
                     .padding(.trailing)
                     .foregroundColor(.black)
                 }
     
                // Stack where the inner elements are arranged/ stacked horizontally
                 ScrollView(.horizontal, showsIndicators: false) {
                     HStack(spacing: 30) {
                         ForEach(workouts.indices, id: \.self) { index in
                             let workout = workouts[index]
                             
                             //day card
                             NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                 ZStack {
                                     Image(workout.image)
                                         .resizable()
                                         .aspectRatio(contentMode: .fill)
                                         .frame(height:220)
                                     
                                     //Vertical Stack - where objects are stacked vertically
                                     VStack {
                                         
                                         Spacer()
                                         
                                         Text(workout.day)
                                             .font(.title2)
                                             .fontWeight(.semibold)
                                             .foregroundColor(.white)
                                         Text(workout.muscleGroup)
                                             .fontWeight(.regular)
                                             .foregroundColor(.white)
                                     }
                                     .padding()
                                     .frame(width:150)
                                     .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                 }
                                 .frame(width: 150, height: 220)
                                 .clipped()
                                 .cornerRadius(20)
                                 .shadow(radius: 8)
                             }
                             .disabled(isEditing)
                             .overlay(
                                 // Show edit icon on Day Cards in edit mode
                                 isEditing && (editDayIndex == index || editMuscleGroupIndex == index) ? AnyView(Image(systemName: "pencil.circle.fill").foregroundColor(.blue)) : AnyView(EmptyView()),
                                 alignment: .topTrailing
                             )
                             .onTapGesture {
                                 if isEditing {
                                     // Enable editing mode for the selected workout
                                     editDayIndex = index
                                     editMuscleGroupIndex = index
                                 }
                             }
                         }
                     }
                     .padding()
                 }
                 .offset(x: 10, y: -30)

                 Spacer()
             }
             .navigationBarTitle("Home Workouts")
         }
         .onChange(of: editDayIndex) { newIndex in
             if var index = newIndex {
                 workouts[index].day = workouts[index].day.uppercased()
             }
         }
         .onChange(of: editMuscleGroupIndex) { newIndex in
             if var index = newIndex {
                 workouts[index].muscleGroup = workouts[index].muscleGroup.uppercased()
             }
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }

 struct Workout: Identifiable {
     //Variable ID is being set to the returned unique identifier generated from the method UUID()
     var id = UUID()
     
     //Variable names with their respective types
     var day: String
     var muscleGroup: String
     var image: String
     var routine: [String]
 }

 let workoutsData = [
     Workout(day: "Monday", muscleGroup: "Chest", image: "workoutPhoto8", routine: ["Warmup", "Bench Press", "Incline Dumbbell Press", "Cable-flies", "Skull-crushers", "Tricep-extensions rope", "Tricep-extensions bar"]),
     Workout(day: "Tuesday", muscleGroup: "Back", image: "workoutPhoto9", routine: ["Warmup", "Pullups", "Deadlift", "Bent-over barbell rows", "Seated machine rows", "Machine pulldowns", "Straight arm lat-pulldown", "Seated incline bicep-curls", "Seated hammer-curls", "Cable-curls"]),
     Workout(day: "Wednesday", muscleGroup: "Legs", image: "workoutPhoto5", routine: ["Warmup", "Squats", "Romanian-deadlifts", "Split-squats", "Leg-curls", "Leg-extensions", "Calf-raises", "Ab-machine", "Ab-routine"]),
     Workout(day: "Thursday", muscleGroup: "Shoulders", image: "workoutPhoto6", routine: ["Warmup", "Military press", "Arnold-press", "Lateral raises", "Bent over lateral raises", "Shrugs"]),
     Workout(day: "Friday", muscleGroup: "Arms", image: "workoutPhoto7", routine: ["Warmup", "Chin-ups", "Close-grip bench press", "Face down on incline bench bicep-curls", "Triceps overhead dumbbell press", "Standing hammer-curls", "Skull-crushers", "Cable-curls rope", "Tricep-extension rope", "Cable-curls bar", "Tricep-extensions bar"])
 ]

 
 */
