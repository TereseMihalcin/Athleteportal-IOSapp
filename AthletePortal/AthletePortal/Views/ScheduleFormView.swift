//
//  ScheduleFormView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 3/21/2021.
//  Edited by Terese Mihalcin on 3/04/2021
//  Edited by Dan Williams on 4/6/21
//
// It's not flawless --need to create a funtion to determine which dates are availible/occupied
//                   --need to find a way to send selected time/facility values to calendarView

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
    
    @State private var expandEvent = false
    
    // Event name variables
    @State private var eventTitle: String = ""
    
    //facilities variables
    @State private var expandFacility = false
    @State private var facilityIndex = "--Select Facility--"
    
    //facilities array
    var facilities = ["--Select Facility--",
                      "Sullivan",
                      "Sullivan film room",
                      "Mckenna",
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
    
    
    var body: some View {
        // This view is the dropdown that allows users to select a facility and time to reserve/schedule a new event. The different sections of the form that users must fill out is "facility" - a dropdown list of all facilities on campus, "time", will allow the user to select a start time and end time, and "type" - this will be a dropdown list of the different team activity types such as practice, lift, meeting, etc.
        // After the form is completed, a function will be called to check the database and see if there is an overlap between times and the selected facility. If there is a conflict, an error message will appear telling the user to select a new time. Again, this will also require my help - Dan.
        
        // Event that will be updated as the user selects values for it, and will eventually be pushed to database
        let newEvent = Event(value: [
                            "_id": ObjectId.generate(),
                            "_partitionKey": "masterSchedule",
                            "facility": $facilityIndex,
                            "team": environmentModel.currentSport,
                            "eventType": $eventTitle,
                            "startDateTime": $scheduleStartDate,
                            "endDateTime": $scheduleEndDate,
        ])
        // List of all events currently in the db, will be referenced to check for overlapping times
//        let events = schedule.events

        
        ScrollView{
        VStack{
            HStack{
                Text("Add Event")
                    .font(.title)
                    .padding(5)
                
                Image(systemName: "chevron.down")
                    .resizable().frame(width: 15, height: 15)
                    
                    }.onTapGesture {
                        self.expandEvent.toggle()
                        
            }
            if expandEvent {
               
                // Enter the name of the event
                TextField("Practice/Lift/Meeting/Conditioning/Game", text: $eventTitle)
                
                Button(action: {
                    
                })
                {
                    Text("Facility")
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
                })
                {
                    Text("Date")
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
                        DatePicker("Start Date/Time", selection: $scheduleStartDate, displayedComponents: [.date, .hourAndMinute])
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .frame(maxHeight: 400)
                        DatePicker("End Date/Time", selection: $scheduleEndDate, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .frame(maxHeight: 400)
                            
                           
                    } .padding(.bottom, 10.0)
                    
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
                        } else {
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
                 
                    
                    Text("Add '\(facilityIndex) starting at \(scheduleStartDate)' to Calendar")
                        .padding(20)
                        .font(.title2)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                    
                }
            }
          
            
                    
            
        }
        // the stylization for the Add Event drop down menu
        .padding(0)
        .border(Color.red, width: 3)
        .animation(.spring())
        .position(x: 160, y: 200)
        
        
     
    }
    }
}

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView()
            .preferredColorScheme(.dark)
            .environment(\.realmConfiguration,
                          app.currentUser!.configuration(partitionValue: "masterSchedule"))

    }
}
