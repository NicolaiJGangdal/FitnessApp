//
//  MainPage.swift
//  FitnessApp
//
//  Created by Nicolai Gangdal on 22/05/2023.
//

import SwiftUI

struct MainPage: View {
    
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
            
            /* This is a background for the whole app
             
            ZStack {
                Image("gymBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                */
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
                        //Footer : This styling is to lift the rest over the footer
                        .padding(.bottom, 40)
                    }
                    .offset(x: 10, y: -30)
                    
                    Spacer()
                }
                .navigationBarTitle("Home Workouts")
//            }
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
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
