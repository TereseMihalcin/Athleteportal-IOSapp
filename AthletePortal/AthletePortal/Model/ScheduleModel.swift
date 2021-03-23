//
//  ScheduleModel.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation

class ScheduleModel: ObservableObject {
    // Every attribute to this class will be @Published, meaning that every value will be able to reference from views as apart of an Environment Object
    
    @Published var masterSchedule: [Event] = []
    // This is an array of all Events that are already scheduled and loaded in the database
    @Published var userSchedule: [Event] = []
    // This is an array of all Events scheduled given for a specific sport, it is loaded after selecting from SportSelectView, and changes based on what
    //      view the user is looking at, such as PracticeView
    @Published var currentSport: String = ""
    // This will be filled with whatever option is selected in SportSelectView with the assignSport() method
    
    // Date Formatter to properly format how dates and times are displayed in the different views
    //      This is only declared once inside the class because it is very resource-intensive
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        df.timeZone = .current
        return df
    }()
    
    // Connection to db here?
    
    // Methods
    // Method to pull from the db and assign the Events created from the db pull to [masterSchedule]
    // Method to assign a selected sport to currentSport within the Environment Object
    func assignSport(sport:String) {
        self.currentSport = sport
    }
    // Method to query and assign all events for currentSport to [userSchedule] so they can be properly manipulated
    // Method to change userSchedule to only Events of type "Practice" for their given sport via query
    //      This is called upon clicking the "Practice" button on the dropdown nav
    // Method to change userSchedule so that the Events for the current team is organized by time
    //      This is called upon clicking the Calendar icon in the default top navbar
    // Method to check if an entered start and end time are overlapping to be used in form submission
    func compareTimes(startTime: Date, endTime: Date) {
        // Pseudocode for query:
        // where location == userSelectedLocation {
        //      if (startTime == after any other events startTime but before that same events endTime)
        //          return false
        //      else
        //          return true
        // }
    }
    // Form submission to the database - upon completion calls method to pull from database and refresh [masterSchedule] and [userSchedule]
    
}
