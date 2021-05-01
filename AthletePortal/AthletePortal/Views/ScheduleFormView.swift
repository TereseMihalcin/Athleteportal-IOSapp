//
//  ScheduleFormView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 30/04/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct ScheduleFormView: View {
    // Will be used to help display dates and use the logged in team as a default team for a new Event
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    // The realm app itself we have loaded and are referencing throughout the app, we need this to push new events to it
    @Environment(\.realm) var realm
        
    // Event name variables
    @State private var expandTitle = false
    @State private var eventTitle: String = ""
    
    //facilities variables
    @State private var expandFacility = false
    @State private var facilityIndex = "Sullivan gym"
    
    //facilities array
    var facilities = ["Sullivan Gym",
                      "Sullivan film room",
                      "Mckenna Gym",
                      "Mckenna Track",
                      "Mckenna film room",
                      "Field House",
                      "Grass field",
                      "Baseball",
                      "Softball",
                      "Football",
                      "Soccer"]
    
    //Date variables
    @State private var expandDate = false
    @State private var scheduleStartDate = Date()
    @State private var scheduleEndDate = Date()
    
    // For the navbar
    @State var showMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainFormNavView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    // Specific UI view code here:

                    // This view is the dropdown that allows users to select a facility and time to reserve/schedule a new event. The different sections of the form that users must fill out is "facility" - a dropdown list of all facilities on campus, "time", will allow the user to select a start time and end time, and "type" - this will be a dropdown list of the different team activity types such as practice, lift, meeting, etc.
                    // After the form is completed, a function will be called to check the database and see if there is an overlap between times and the selected facility. If there is a conflict, an error message will appear telling the user to select a new time. Again, this will also require my help - Dan.
                    
                    // Event that will be updated as the user selects values for it, and will eventually be pushed to database
                    let newEvent = Event(value: [
                                        "_id": ObjectId.generate(),
                                        "_partitionKey": "masterSchedule",
                                        "facility": facilityIndex,
                                        "team": environmentModel.currentSport,
                                        "eventType": eventTitle,
                                        "startDateTime": scheduleStartDate,
                                        "endDateTime": scheduleEndDate,
                    ])
                        
                        // ScrollView to contain the actual UI code for this view
                        ScrollView{
                        VStack{
                            
                            Button(action: {
                                // Nothing necessary here becuase of the .onTapGesture below
                            })
                            {
                                HStack{
                                    Text("Choose Facility")
                                    Image(systemName: "chevron.down")
                                }
                                .padding(7)
                                .font(.title)
                                .background(Color.red)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    self.expandFacility.toggle()
                                }
                            }
                            // could make it so you must click facility before time but not going to for time constraints
                                
                            if expandFacility {
                                
                                Section {
                                    Picker (selection : $facilityIndex, label :
                                                Text("Facilities")) {
                                        ForEach(facilities, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                } .padding(.bottom, 10.0)
                                // make a list of all availible facility times
                            }
                           
                            Button(action: {
                                // Nothing necessary here becuase of the .onTapGesture below
                            })
                            {
                                HStack{
                                    Text("Choose Start and End Time")
                                    Image(systemName: "chevron.down")
                                }
                                .padding(7)
                                .font(.title)
                                .background(Color.red)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    self.expandDate.toggle()
                                }

                            
                            }
                            
                            if expandDate {
                                //select date and time with DatePicker
                                Section {
                                    Text("Use this to select the start date and time of your event:")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.red)
                                        .multilineTextAlignment(.center)
                                    DatePicker("Start Date/Time", selection: $scheduleStartDate, displayedComponents: [.date, .hourAndMinute])
                                        .datePickerStyle(WheelDatePickerStyle())
                                        .labelsHidden()
                                        .frame(maxHeight: 400)
                                    Text("Use this to select the end time of your event:")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.red)
                                    DatePicker("End Date/Time", selection: $scheduleEndDate, displayedComponents: .hourAndMinute)
                                        .datePickerStyle(WheelDatePickerStyle())
                                        .labelsHidden()
                                        .frame(maxHeight: 400)
                                        
                                       
                                } .padding(.bottom, 10.0)
                                
                            }
                            
                            Button(action: {
                                // Nothing necessary here becuase of the .onTapGesture below
                            })
                            {
                                HStack{
                                    Text("Select Event Type")
                                    Image(systemName: "chevron.down")
                                }
                                .padding(7)
                                .font(.title)
                                .background(Color.red)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .onTapGesture {
                                    self.expandTitle.toggle()
                                }
                            }
                            
                            if expandTitle {
                                Text("Please write either 'Practice', 'Lift', 'Meeting', 'Conditioning', or 'Game':")
                                    .fontWeight(.heavy)
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                                HStack {
                                    Spacer()
                                    Text("Event Type:")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.red)
                                    TextField("", text: $eventTitle)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                    Spacer()
                                }
                            }
                            
                            Button(action: {
                                
                                // Check to see if the contents of $facilityIndex and $scheduleDate are already taken
                                for event in events {
                                    if (event.startDateTime == scheduleStartDate && event.facility == facilityIndex) {
                                        Text("Could not create event, there is a conflict with another event, please try again.")
                                        print("Could not create event, there is a conflict with another event, please try again.")
                                    } else if (event.startDateTime < scheduleEndDate && event.startDateTime > scheduleStartDate && event.facility == facilityIndex) {
                                        Text("Could not create event, there is a conflict with another event, please try again.")
                                        print("Could not create event, there is a conflict with another event, please try again.")
                                    } else if (event.endDateTime > scheduleStartDate && event.endDateTime < scheduleEndDate && event.facility == facilityIndex) {
                                        Text("Could not create event, there is a conflict with another event, please try again.")
                                        print("Could not create event, there is a conflict with another event, please try again.")
                                    } else if (facilityIndex == "") {
                                        Text("Could not create event, you did not correctly name the facility, please try again.")
                                    } else if (eventTitle == "") {
                                        Text("Could not create event, you did not correctly title the event, please try again.")
                                    }
                                    else {
                                        // Create new Event and push the contents to DB
                                        // Make sure to wrap this write in a try/catch - Mongodb just cancels the write if there's a problem
                                        try! realm.write {
                                            realm.add(newEvent)
                                        }
                                        // Print to console to confirm the write and Event creation was successful
                                        print("New event added!")
                                    }
                                }
                                   
                                
                            })
                            {
                                Text("Add your new event for the \(environmentModel.currentSport) team")
                                    .frame(width: 230, height: 60)
                                    .padding(20)
                                    .font(.title2)
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                                    .lineLimit(3)
                                    .foregroundColor(Color.white)
                            }
                            HStack{
                                Spacer()
                                Text("Your new event is at \(facilityIndex), starting at \(scheduleStartDate)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                        }
                        // the stylization for the Add Event drop down menu
                        .padding(.top, 100)
                        .animation(.spring())
                        
                        }

                    
                    // UI code ends, rest of the code is now navbar related
                    if self.showMenu {
                        NavContentView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
        }
    }
}

struct MainFormNavView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Button(action: {
            withAnimation {
               self.showMenu = true
            }
        }) {
        }
        
    }
        
    }

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView()
    }
}
