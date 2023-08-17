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


/* Original since last commit
import SwiftUI

struct ContentView: View {
    
    //Subtitles editable - locally saved here
    
    //Day Card 1
    @AppStorage("subTitle1") var subTitle1: String = "Legs"
    @State private var editedSubtitle: String = ""
    @State private var isEditing: Bool = false
    @State private var showAlert = false
    
    //Day Card 2
    @AppStorage("subTitle2") var subTitle2: String = "Chest"
    @State private var editedSubtitle2: String = ""
    @State private var isEditing2: Bool = false
    @State private var showAlert2 = false
    
    //Day Card 3
    @AppStorage("subTitle3") var subTitle3: String = "Back"
    @State private var editedSubtitle3: String = ""
    @State private var isEditing3: Bool = false
    @State private var showAlert3 = false
    
    //Day Card 4
    @AppStorage("subTitle4") var subTitle4: String = "Shoulders"
    @State private var editedSubtitle4: String = ""
    @State private var isEditing4: Bool = false
    @State private var showAlert4 = false
    
    //Day Card 5
    @AppStorage("subTitle5") var subTitle5: String = "Arms"
    @State private var editedSubtitle5: String = ""
    @State private var isEditing5: Bool = false
    @State private var showAlert5 = false
    
    //Day Card 6
    @AppStorage("subTitle6") var subTitle6: String = "Cardio"
    @State private var editedSubtitle6: String = ""
    @State private var isEditing6: Bool = false
    @State private var showAlert6 = false
    
    //Day Card 7
    @AppStorage("subTitle7") var subTitle7: String = "Rest"
    @State private var editedSubtitle7: String = ""
    @State private var isEditing7: Bool = false
    @State private var showAlert7 = false
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                
                // Added this VStack and changed the name to NavigationLink
                // This is to redirect the element within to open
                NavigationLink(destination: HwView()) {
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
                
                Text("Weekly Plan")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                
                // Stack where the inner elements are arranged/ stacked horizontally
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        
                        //Day card 1
                        NavigationLink(destination: WorkoutDetailView()) {
                            ZStack {
                                Image("workoutPhoto2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Monday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle1)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle = subTitle1
                                    isEditing = true
                                    showAlert = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 20)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert) {
                            TextField("Enter New Subtitle", text: $editedSubtitle)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 2
                        NavigationLink(destination: WorkoutDetailView2()) {
                            ZStack {
                                Image("workoutPhoto3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Tuesday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle2)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle2 = subTitle2
                                    isEditing2 = true
                                    showAlert2 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 20)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert2) {
                            TextField("Enter New Subtitle", text: $editedSubtitle2)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle2)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 3
                        NavigationLink(destination: WorkoutDetailView3()) {
                            ZStack {
                                Image("workoutPhoto4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Wednesday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle3)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle3 = subTitle3
                                    isEditing3 = true
                                    showAlert3 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 20)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert3) {
                            TextField("Enter New Subtitle", text: $editedSubtitle3)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle3)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 4
                        NavigationLink(destination: WorkoutDetailView4()) {
                            ZStack {
                                Image("workoutPhoto5")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Thursday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle4)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle4 = subTitle4
                                    isEditing4 = true
                                    showAlert4 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 20)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert4) {
                            TextField("Enter New Subtitle", text: $editedSubtitle4)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle4)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 5
                        NavigationLink(destination: WorkoutDetailView5()) {
                            ZStack {
                                Image("workoutPhoto6")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Friday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle5)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle5 = subTitle5
                                    isEditing5 = true
                                    showAlert5 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 25)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert5) {
                            TextField("Enter New Subtitle", text: $editedSubtitle5)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle5)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 6
                        NavigationLink(destination: WorkoutDetailView6()) {
                            ZStack {
                                Image("workoutPhoto7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Saturday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle6)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle6 = subTitle6
                                    isEditing6 = true
                                    showAlert6 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 10)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert6) {
                            TextField("Enter New Subtitle", text: $editedSubtitle6)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle6)
                            Button("Cancel", role: .cancel) {}
                        }
                        
                        //Day card 7
                        NavigationLink(destination: WorkoutDetailView7()) {
                            ZStack {
                                Image("workoutPhoto8")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height:220)
                                
                                //Vertical Stack - where objects are stacked vertically
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text("Sunday")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(subTitle7)
                                        .fontWeight(.regular)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width:150)
                                .background(Color(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 0.5)))
                                
                                // Button with three dots in the top right corner
                                Button(action: {
                                    editedSubtitle = subTitle7
                                    isEditing7 = true
                                    showAlert7 = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.horizontal, 15)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(10)
                            }
                            
                            .frame(width: 150, height: 220)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 8)
                        }
                        .alert("Change Subtitle", isPresented: $showAlert7) {
                            TextField("Enter New Subtitle", text: $editedSubtitle7)
                                .foregroundColor(.black)
                            Button("Save", action: submitSubtitle7)
                            Button("Cancel", role: .cancel) {}
                        }
                    }
                    .padding()
                }
                .offset(x: 10, y: -30)
                
                Spacer()
            }
            .navigationBarTitle("Home Workouts")
        }
    }
    
    func submitSubtitle() {
        subTitle1 = editedSubtitle
        isEditing = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle2() {
        subTitle2 = editedSubtitle2
        isEditing2 = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle3() {
        subTitle3 = editedSubtitle3
        isEditing3 = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle4() {
        subTitle4 = editedSubtitle4
        isEditing4 = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle5() {
        subTitle5 = editedSubtitle5
        isEditing5 = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle6() {
        subTitle6 = editedSubtitle6
        isEditing6 = false
        //subTitle1.append(editedSubtitle)
    }
    
    func submitSubtitle7() {
        subTitle7 = editedSubtitle7
        isEditing7 = false
        //subTitle1.append(editedSubtitle)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/













//CalendarTestView

/*
 
 import SwiftUI

 struct CalendarTestView: View {
     @State private var selectedMonth = Date()
     @State private var selectedDate = Date()
     @State private var isShowingEventSheet = false
     @State private var events: [Event] = []
     
     var body: some View {
         VStack {
             HStack {
                 Button(action: {
                     selectedMonth = Calendar.current.date(byAdding: .month, value: -1, to: selectedMonth)!
                 }) {
                     Image(systemName: "chevron.left")
                 }
                 
                 Text(monthString(from: selectedMonth))
                     .font(.title)
                 
                 Button(action: {
                     selectedMonth = Calendar.current.date(byAdding: .month, value: 1, to: selectedMonth)!
                 }) {
                     Image(systemName: "chevron.right")
                 }
             }
             .padding()
             
             VStack {
                 ForEach(datesOfMonth().chunks(7), id: \.self) { row in
                     HStack(spacing: 0) {
                         ForEach(row, id: \.self) { date in
                             Button(action: {
                                 selectedDate = date
                                 isShowingEventSheet = true
                             }) {
                                 Text(dayString(from: date))
                                     .frame(maxWidth: .infinity)
                                     .padding()
                                     .background(date == currentDate() ? Color.blue.opacity(0.5) : Color.gray.opacity(0.1))
                                     .cornerRadius(8)
                             }
                             .sheet(isPresented: $isShowingEventSheet) {
                                 EventAddView(selectedDate: $selectedDate, events: $events)
                             }
                         }
                     }
                 }
             }
             
             Spacer()
             //File2()
         }
     }
     
     func monthString(from date: Date) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "MMMM yyyy"
         return dateFormatter.string(from: date)
     }
     
     func dayString(from date: Date) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "d"
         return dateFormatter.string(from: date)
     }
     
     func datesOfMonth() -> [Date] {
         let calendar = Calendar.current
         let range = calendar.range(of: .day, in: .month, for: selectedMonth)!
         let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: selectedMonth))!
         return (0..<range.count).map { calendar.date(byAdding: .day, value: $0, to: firstDayOfMonth)! }
     }
     
     func currentDate() -> Date {
         let calendar = Calendar.current
         let components = calendar.dateComponents([.year, .month, .day], from: Date())
         return calendar.date(from: components)!
     }
 }

 extension Array {
     func chunks(_ size: Int) -> [[Element]] {
         return stride(from: 0, to: count, by: size).map {
             Array(self[$0..<Swift.min($0 + size, count)])
         }
     }
 }

 struct Event: Identifiable {
     let id = UUID()
     let date: Date
     let title: String
     let subtitle: String
 }

 struct EventAddView: View {
     @Environment(\.presentationMode) var presentationMode
     @Binding var selectedDate: Date
     @Binding var events: [Event]
     
     @State private var isAddingEvent = false
     @State private var eventTitle = ""
     @State private var eventSubtitle = ""
     
     var body: some View {
         VStack {
             Text(dateString(from: selectedDate))
                 .font(.title)
                 .padding()
             
             Spacer()
             //File2()

         }
         .navigationBarTitle("", displayMode: .inline)
         .navigationBarItems(trailing: Button("Done") {
             presentationMode.wrappedValue.dismiss()
         })
     }
     
     func dateString(from date: Date) -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
         return dateFormatter.string(from: date)
     }
 }


 struct CalendarTestView_Previews: PreviewProvider {
     static var previews: some View {
         CalendarTestView()
     }
 }


 */
