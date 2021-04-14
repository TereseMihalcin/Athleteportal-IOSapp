//
//  CalendarView.swift
//  AthletePortal
//
//  Created by Daniel Williams on 21/03/2021.
//

import Foundation
import SwiftUI
import RealmSwift
import Combine

struct CalendarView: View {
    // Will be used to help display dates
    @EnvironmentObject var environmentModel: EnvironmentModel
    
    // Results containing all events from the database - var will be used when creating schedule list
    @ObservedResults(Event.self) var events
    
    var body: some View {
        // Query to modify the db results to fit the "schedule view" format of being in timed order (frontend - please do not touch)
        let schedule = events.sorted(byKeyPath: "startDateTime", ascending: true)
        
        // This view is what is displayed when the calender icon is selected from the calendar icon on the default navbar. It should display all upcoming scheduled events based on the selected sport in SportSelectView
        // Similar to PracticeView, querying the group so that it displays events based on startTime may require my help as well - Dan, just
        //      reach out and we can figure it out together
        
        VStack {
            // Navbar gets added to the top of every view we use
            NavbarView()
                .environment(\.realmConfiguration,
                             app.currentUser!.configuration(partitionValue: partitionValue))
            
            // Replace this with the actual UI code:
            Text("Calendar View")
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .preferredColorScheme(.dark)
            .environment(\.realmConfiguration,
                          app.currentUser!.configuration(partitionValue: "masterSchedule"))

    }
}
